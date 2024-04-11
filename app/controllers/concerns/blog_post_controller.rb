class BlogPostController < ApplicationController
  before_action :set_blog_post , except: [:index, :new, :create]

  def set_blog_post
    @blog_post = BlogPost.find_by(id: params[:id])
  end
  def index
    @blog_posts = BlogPost.all
  end

  def show
    if !@blog_post.present?
      redirect_to root_path
    end
  rescue
    redirect_to root_path
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(get_params)

    if @blog_post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if !@blog_post.present?
      redirect_to posts_path
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to root_path
  end

  def update
    if @blog_post.present?
      @blog_post.update(get_params)
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def get_params
    return params.require(:blog_post).permit(:title, :body)
  end
end