class UsersController < ApplicationController
    # before_action :ensure_logged_in, 
    def show
        @user = User.find(params[:id])
        render :show
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in_user!(@user)
            redirect_to user_url(@user.id)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end
    private
    def user_params
        params.require(:user).permit(:email,:password)
    end
end