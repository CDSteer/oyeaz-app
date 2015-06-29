class LocationsController < ApplicationController

	# def index
	# 	@location = Location.all
	# 	# @location = Location.find(params[:user_id])
	# end

	def show
		@user = User.find(params[:user_id])
	end

	def new
		getLocation
		@user = User.find(params[:user_id])
		@location = Location.create(:latitude => @latitude, :longitude => @longitude, :user_id => @user.id)
		@location.save
		# redirect_to location_path(@locations)
	end
 
  private

    def getLocation
		@lat_lng = cookies[:lat_lng].split("|")
		@latitude = @lat_lng.at(0)
		@longitude = @lat_lng.at(1)
	end

end
