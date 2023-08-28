class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  def index
    if params[:search]
      @blogs = Blog.where('title LIKE ? OR content LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").paginate(page: params[:page], per_page: 10)
    else
      @blogs = Blog.paginate(page: params[:page], per_page: 10)
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)
    @blog.publication_date = DateTime.now
    @blog.user = current_user
    if @blog.save
      redirect_to @blog
    else
      render :new
    end
  end

  # GET /blogs/1
  def show
    @blog
  end

  # GET /blogs/1/edit
  def edit
    @blog
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
    redirect_to blogs_url
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :publication_date)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
