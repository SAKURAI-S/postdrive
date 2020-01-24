class UsersController < ApplicationController
	def show
		@user = User.find(params[:id]) # ここを記述
	end

	def index
		@user = current_user
	end

	def edit
        @user = User.find(params[:id])
        if current_user.id != @user.id
      	redirect_to users_path(current_user.id)
		end
    end

    def update
    	@user = User.find(params[:id])
    	if @user.update(user_params)
       redirect_to users_path(@user.id),notice:'successfully'
       # flash[:success] = 'successfully'
    	else
       # @user =  User.find(params[:id])
    	end
    end


private
  def user_params
    params.require(:user).permit(:username, :profile_image_id, :introduction)
  end
end