class UserImagesController < ApplicationController

	def new
	end

	def create
	end

	def index
	end

	def show
	end

	def destroy
		@user_image = Userimage.find(params[:id])
		@user_image.destroy
		redirtect_to user_images_path
	end
	
end
