require 'will_paginate/array' 

class UsersController < ApplicationController

    def show
      @user = current_user
      @posts = @user.posts.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    end
  
end
