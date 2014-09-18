Rails.application.routes.draw do

  mount OktaSaml::Engine => "/okta_saml"
end
