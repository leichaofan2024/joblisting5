class WelcomeController < ApplicationController

  def index
    flash[:notice] = "welcome to Super's world!"
  end 
end
