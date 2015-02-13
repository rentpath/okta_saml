require 'spec_helper'
require 'rubygems'
require 'ruby-saml'

describe SamlController, type: :controller do
  include OktaApplicationHelper, OktaSaml::SessionHelper

  describe 'initialize SAML for transmission to IDP' do
    before(:each) do
      SamlController.any_instance.stub(:idp_login_request_url).with(request).and_return("http://www.example.com")
    end

    it 'should get root' do
      get 'init'
      expect(response).to redirect_to("http://www.example.com")
    end
  end

  describe 'handle the response from IDP consume' do

    before(:each) do
      @redirect_path = "http://www.redirect_path.com"
      @email = "test@test.com"
      @attributes =  {:first_name => "John", :last_name => "Doe"}
      @issuer = "http://www.example.com/foo/bar"
      i_response = double("response", {:is_valid? => true, :'settings=' => "", :name_id => @email, :attributes => @attributes, :issuer => @issuer })
      SamlController.any_instance.stub(:idp_response).and_return(i_response)
      SamlController.any_instance.stub(:saml_settings).with(anything()).and_return("")
      SamlController.any_instance.stub(:redirect_url).and_return(@redirect_path)
    end

    it 'should redirect based on valid idp response' do
      post 'consume', {"SAMLResponse" => "Test Response"}
      response.should be_redirect
      expect(response).to redirect_to(@redirect_path)
      expect(controller.current_user.email).to eq(@email)
      expect(controller.current_user.attributes).to eq(@attributes)
      expect(controller.current_user.issuer).to eq(@issuer)
    end
  end

  it "has a configurable parent class" do
    # FakeParentController is configured in okta_saml initializer in the dummy app
    expect(SamlController.ancestors).to include(FakeParentController)
  end
end
