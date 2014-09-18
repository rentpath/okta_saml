module OktaApplicationHelper

  def saml_settings(request)
    settings = Onelogin::Saml::Settings.new

    settings.assertion_consumer_service_url = saml_consume_url(host: request.host)
    settings.issuer                         = "http://#{request.port == 80 ? request.host : request.host_with_port}"
    settings.idp_sso_target_url             = SAML_SETTINGS[:idp_sso_target_url]
    settings.idp_cert_fingerprint           = SAML_SETTINGS[:idp_cert_fingerprint]
    settings.name_identifier_format         = "urn:oasis:names:tc:SAML:2.0:attrname-format:unspecified"
    # Optional for most SAML IdPs
    settings.authn_context = "urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport"

    settings
  end

  def idp_login_request_url(request)
    idp_request = Onelogin::Saml::Authrequest.new
    idp_request.create(saml_settings(request))
  end

end