class SamlController < ApplicationController
  include OktaSaml::SessionHelper, OktaApplicationHelper

  skip_before_action :okta_authenticate!, :okta_logout
  skip_before_action :authenticate_user!

  def init
    redirect_to(idp_login_request_url(request))
  end

  def consume
    response = Onelogin::Saml::Response.new(params[:SAMLResponse])
    response.settings = saml_settings(request)
    if response.is_valid?
      sign_in(OktaUser.new({:email => response.name_id}))
      redirect_to redirect_url
    else
      render :text => "Failure"
    end
  end

  private

  def redirect_url
    session[:redirect_url]
  end

  # Rails override to handle unverified post requests from Okta
  def handle_unverified_request
  end

end
