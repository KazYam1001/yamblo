class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    set_all_posts
  end

  def create
    @post = Post.new(post_params)
    @post.save
    set_all_posts
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def update
    @post.update(post_params)
    set_all_posts
  end

  def destroy
    @post.destroy
    set_all_posts
  end

  private
  def post_params
    params.require(:post).permit(:title, :image, :body).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_all_posts
    @posts = Post.order('created_at DESC').page(params[:page]).per(20)
  end
end
