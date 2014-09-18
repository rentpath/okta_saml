require 'rubygems'
require 'ruby-saml'
require_relative 'session_helper'

class ActionController::Base
  include OktaSaml::SessionHelper

  def okta_authenticate!
    session[:redirect_url] = params[:app_referer] || "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
    redirect_to saml_init_path unless signed_in?
  end

  def okta_logout
    redirect_to saml_logout_path
  end

end

module OktaSaml
  class Engine < Rails::Engine
    def initialize
      require "okta_saml/constants"
      Rails.application.config.session_store :active_record_store, :key => '_my_key', :domain=> :all
      add_engine_helpers
    end

    def add_engine_helpers
      ActiveSupport.on_load :action_controller do
        helper OktaSaml::SessionHelper
      end
    end
  end
end