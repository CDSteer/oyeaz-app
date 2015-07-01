class UserController < ApplicationController
	def show
		@user = User.find(params[:user_id])
	end

	def destroy
		@user = User.find(params[:user_id])
		@user.destroy
		redirect_to root_path
	end
end
