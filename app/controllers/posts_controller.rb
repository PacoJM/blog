class PostsController < ApplicationController
	def index
		@posts =Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :text))
 
  		if @post.save
  			redirect_to action: :show, id: @post.id
		else
			render 'new'
		end
	end

 	def show
		@post = Post.find(params[:id])
	end

	private
  		def post_params
    	params.require(:post).permit(:title, :text)
	end

end
