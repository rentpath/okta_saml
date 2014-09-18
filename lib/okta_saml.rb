require "okta_saml/version"
require "okta_saml/session_helper"

module OktaSaml
  if defined?(Rails)
    require "okta_saml/engine"
  end
end
