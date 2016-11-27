class ApplicationController < ActionController::Base
  include RouteBound
  protect_from_forgery with: :exception
end
