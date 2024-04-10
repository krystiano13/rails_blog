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
end