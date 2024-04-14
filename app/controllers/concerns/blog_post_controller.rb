class BlogPostController < ApplicationController
  before_action :authenticate_user! , except: [:index, :show]
  before_action :set_blog_post , except: [:index, :new, :create]

  def set_blog_post
    if user_signed_in?
      @blog_post = BlogPost.find_by(id: params[:id])
    else
      @blog_post = BlogPost.published.find_by(id: params[:id])
    end
  end
  def index
    @blog_posts = BlogPost.published
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
    return params.require(:blog_post).permit(:title, :body, :published_at)
  end
end