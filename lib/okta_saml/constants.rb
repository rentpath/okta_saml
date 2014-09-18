if defined?(Rails)
  saml = begin
    YAML::load_file(Rails.root.join("config/okta_saml.yml").to_s)
  rescue Errno::ENOENT
    p "Missing okta_saml.yml file in Rails.root/config"
  end
  SAML_SETTINGS = {
    :idp_sso_target_url => saml[Rails.env]['idp_sso_target_url'],
    :idp_cert_fingerprint => saml[Rails.env]['idp_cert_fingerprint']
  }
end