class MainController < ApplicationController
  before_action :authenticate_user!
  layout 'main'
end
