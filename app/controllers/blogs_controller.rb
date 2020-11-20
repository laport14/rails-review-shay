class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :update, :destroy]

  # GET /users
  def index
    @user = User.find(params[:user_id])
    @blogs = @user.blogs

    render json: @blogs
  end

  # GET /users/1
  def show
    render json: @blog
  end

  # POST /users
  def create
    # @user = User.find(params[:user_id])
    @blog = Blog.new(blog_params)
    # @user.blogs << @blog
    # or
    # @blog.user = @user
    if @blog.save
      render json: @blog, status: :created
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @blog.update(blog_params)
      render json: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @blog.destroy
  end

  def random_blog
    @blog = Blog.all.sample
    render json: @blog
  end
  def find_all_blogs 
    @blogs = Blog.all
    render json: @blogs
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blog_params
      params.require(:blog).permit(:title, :content, :author, :user_id)
    end
end
