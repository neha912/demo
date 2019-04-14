class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def feed

  end

  def new
    @post = Post.new
  end

   def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post was created successfully"
      redirect_to @post
    else
      render :new
    end
   end


  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
    if @post.update post_params
      flash[:success] = "The post was updated successfully"
      redirect_to @post
    else
      flash.now[:danger] = "Error while submitting post"
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_url
  end

 
  private

    def find_post
      @post = Post.find_by(id: params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :image, :user_id)
    end

end