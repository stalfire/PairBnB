class WelcomeController < ApplicationController
	def index
		if current_user != nil
			@listing = Listing.where(user_id:current_user.id)
		end
	end
end
