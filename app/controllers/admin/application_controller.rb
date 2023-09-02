class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate

  def authenticate
    authenticate_or_request_with_http_digest(Settings.admin_realm) do |username|
      Settings.admin_username == username ? Settings.admin_password : nil
    end
  end
end
