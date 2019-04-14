class WelcomeController < ApplicationController
  def home
    @users = User.all
  end
end
