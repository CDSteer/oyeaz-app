class LocationsController < ApplicationController

	def index
		
	end

	def show
		if current_user
			@user = User.find(params[:user_id])
		else 
			redirect_to root_path
		end 
	end

	def new
		if current_user
			getLocation
			@user = User.find(params[:user_id])
			@location = Location.create(:latitude => @latitude, :longitude => @longitude, :user_id => @user.id)
			@location.save
		else
			redirect_to root_path
		end
	end

	def update
		if current_user
			getLocation
			@location = Location.find(params[:user_id])
			@location.latitude = @latitude
			@location.longitude = @longitude
			@location.update
			redirect_to user_path
		else
			redirect_to root_path
		end
	end
 
 	def destroy
 		if current_user
			@location = Location.find(params[:user_id])
			@location.destroy
			redirect_to articles_path
		else
			redirect_to root_path
		end
	end

  private
    def getLocation
		@lat_lng = cookies[:lat_lng].split("|")
		@latitude = @lat_lng.at(0)
		@longitude = @lat_lng.at(1)
	end

end
