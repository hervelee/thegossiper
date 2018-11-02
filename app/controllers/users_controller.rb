class UsersController < ApplicationController

	def new 
		@user = User.new
	end 

	def create 
		puts   "----------------------------------------"

		user_params = params.require(:user).permit(:username, :password)

		@user = User.create(user_params)
puts @user

puts   "----------------------------------------"

    redirect_to (root_path)
	end

  def index
    @users = User.all
  end
end
	