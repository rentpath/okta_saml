module OktaSaml
  module SessionHelper
    def sign_in(user)
      cookies.signed[:remember_token] = {
        :value => user.email
      }
      current_user = user
    end

    def signed_in?
      !current_user.nil?
    end

    def current_user=(user)
      @current_user = user
    end

    def current_user
      @current_user ||= user_from_remember_token
    end

    alias_method :okta_user, :current_user

    def destroy
      sign_out
    end

    def sign_out
      cookies.delete(:remember_token)
      current_user = nil
    end

    private
      def user_from_remember_token
        OktaUser.retrieve_from_cookie(remember_token)
      end

      def remember_token
        cookies.signed[:remember_token]
      end
  end
end
