class HomeController < ApplicationController
	def new
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		if @user.save
			render :json => @user
		else
			redirect_to 'root_url'
		end
	end

	def show
		@users = User.all
		render :json => @users
	end

	private
	def user_params
		params.require(:user).permit(:name, :address) if params[:user]
	end
end
