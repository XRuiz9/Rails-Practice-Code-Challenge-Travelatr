class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
	end

	def create
		@post = Post.create(post_params)

		if @post.valid?
			redirect_to post_path(@post)
		else
			flash.now[:error] = @post.errors.full_messages
			render :new
		end
	end

	def show
		set_post

		if params[:like]
			@post.likes += 1
			@post.save
		end
	end

	def edit
		set_post
	end

	def update
		set_post
		@post.update(post_params)

		if @post.valid?
			redirect_to post_path(@post)
		else
			flash.now[:error] = @post.errors.full_messages
			render :edit
		end
	end

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
	end
end