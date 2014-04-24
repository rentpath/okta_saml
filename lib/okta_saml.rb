require "okta_saml/version"
require "okta_saml/session_helper"

module OktaSaml
  if defined?(Rails) && Rails::VERSION::MAJOR >= 3
    require "okta_saml/engine"
  end
end
