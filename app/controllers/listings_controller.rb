class ListingsController < ApplicationController
	def index
		# @all_listings = Listing.all
		@all_listings = Listing.paginate(:page => params[:page], :per_page => 10)
	end
	def new
		@listing = Listing.new
	end
	def create
		@listing = Listing.new(listing_from_params)
  		if @listing.save
    		redirect_to root_path
  		else
    		render 'new'
  		end
	end
	def edit
		@listing = Listing.where(user_id: current_user.id)
	end
	def update
		@listing = Listing.where(user_id: current_user.id)
		if @listing.update(listing_from_params)
	    	redirect_to root_path
	  	else
	    	render 'edit'
	  	end
	end

private
	def listing_from_params
		params.require(:listing).permit(:name,:country,:zipcode,:avatar,:user_id)
	end
=begin
#dont know what is this	
	def new
		# authorization code
		if user.customer?
			flash[:notice] = "Sorry. You are not allowed to perform this action."
			return redirect_to some_other_url, notice: "Sorry. You do not have the permissino to verify a property."
		end
	# end authorization code

	# other code to make the new action work!
	end
=end
end
