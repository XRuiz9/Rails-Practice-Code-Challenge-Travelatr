class BloggersController < ApplicationController
	def index
		@bloggers = Blogger.all
	end

	def new
	end

	def create
		@blogger = Blogger.create(params.require(:blogger).permit(:name, :bio, :age))

		if @blogger.valid?
			redirect_to blogger_path(@blogger)
		else
			flash.now[:error] = @blogger.errors.full_messages
			render :new
		end
	end

	def show
		@blogger = Blogger.find(params[:id])
	end
end