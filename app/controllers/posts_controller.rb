# ./app/controllers/posts_controller.rb
class PostsController < Controller
  def index
    @posts = Post.all
  end
end