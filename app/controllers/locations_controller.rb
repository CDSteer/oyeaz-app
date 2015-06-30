class LocationsController < ApplicationController
	# localhost:3000/users/1/locations/new?latitude=1&longitude=1
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
			@user = User.find(params[:user_id])
			@location = Location.create(:latitude => params[:latitude], :longitude => params[:longitude], :user_id => @user.id)
			@js_response = ActiveSupport::JSON.encode(@location)
			respond_to do |format|
				format.json { render :json => @js_response} 
				format.html
			end
			# redirect_to root_path
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
			@user = User.find(params[:user_id])
			@location = Location.create(:latitude => params[:latitude], :longitude => params[:longitude], :user_id => @user.id)
			@js_response = ActiveSupport::JSON.encode(@location)
			respond_to do |format|
				format.json { render :json => @js_response} 
				format.html
			end
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
    	@lat_lng = "0|0" 
		@lat_lng = cookies[:lat_lng].split("|")
		@latitude = @lat_lng.at(0)
		@longitude = @lat_lng.at(1)
	end

end
