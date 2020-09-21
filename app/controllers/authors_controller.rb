class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
  end

  def posts_index
    if params[:author_id]
      @posts = Author.find(params[:author_id]).posts
    else
      @posts = Post.all
    end
end

def post
  @author = Author.find(params[:id])

  # Note that because ids are unique by table we can go directly to
  # Post.find — no need for @author.posts.find...
  @post = Post.find(params[:post_id])
  render template: 'posts/show'
end

end
