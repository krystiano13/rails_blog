class BlogPostController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find_by(id: params[:id])

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
    @blog_post = BlogPost.find_by(id: params[:id])

    if !@blog_post.present?
      redirect_to posts_path
    end
  end

  def update
    @blog_post = BlogPost.find_by(id: params[:id])

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