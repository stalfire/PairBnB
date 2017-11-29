class UsersController < Clearance::UsersController
	def edit
  		@user = User.find(current_user.id)
	end
 	def update
	  	@user = User.find(current_user.id)
	 
	  	if @user.update(user_from_params)
	    	redirect_to root_path
	  	else
	    	render 'edit'
	  	end
	end
private
	def user_from_params
		params.require(:user).permit(:name,:email,:password,:avatar)
	end
=begin
 ###new rails way to permit params####

	def user_params
		params.require(:user).permit(:name,:email,:password)
	end
###old way###	
	def user_from_params
		email = user_params.delete(:email)
		password = user_params.delete(:password)
		name = user_params.delete(:name)

		Clearance.configuration.user_model.new(user_params).tap do |user|
			user.email = email
			user.password = password
			
			user.name = name
		end
	end	
=end
end
