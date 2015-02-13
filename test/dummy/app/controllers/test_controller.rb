class TestController < ApplicationController
  before_filter :okta_authenticate!

  def index
    render json: current_user.to_json
  end
end
