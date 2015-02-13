class TestController < ApplicationController
  before_filter :okta_authenticate!

  def index
    render text: 'success'
  end
end
