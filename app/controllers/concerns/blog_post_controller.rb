class BlogPostController < ApplicationController
  def index
    @blog_post = BlogPost.all
  end
end