class UsersController < Clearance::UsersController
	
	def new
	    @user = User.new
	    render layout: false
	end

	def create
	    @user = user_from_params

    	if @user.save
			sign_in @user
			redirect_back_or url_after_create
    	else
    		flash[:danger] = @user.errors.full_messages
			redirect_to '/sign_up'
    	end
    end

	def user_from_params
		User.new(user_params)
	end

	def user_params
		params.require(:user).permit(:email, :first_name, :last_name, :gender, :phone, :country, :birthdate, :password, :password_confirmation)
	end

end