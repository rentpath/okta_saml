require 'spec_helper'

describe 'saml' do

  before(:each) do
  end

  it 'should get root' do
    get '/saml/init'
    expect(true).to be_true
    response.should be_redirect
    expect(response).to redirect_to('/saml/init')
  end

end