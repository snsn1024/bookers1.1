class PostImagesController < ApplicationController

	def create
		@post_image = PostImage.new(post_image_params)
		@post_image.user_id = current_user.id
		@post_image.save
	end

	def destroy
		@post_image = PostImage.find(params[:id])
		@post_image.destroy

private
def post_image_params
	params.require(:post_image).permit(:image,:intro)
end
