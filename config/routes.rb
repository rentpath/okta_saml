Rails.application.routes.draw do
  get '/saml/init' => 'saml#init'
  post '/saml/consume' => 'saml#consume'
end
