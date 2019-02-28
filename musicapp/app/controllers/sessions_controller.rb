class SessionsController < ApplicationController
#  before_action :ensure_logged_in
def new
    render :new
end

def create
   user = User.find_by_credentials(*params[:user].values)
   if user
    log_in_user!(user)
    redirect_to user_url(user.id)
   else
    flash[:errors] = ["Invalid pass/email"]
    redirect_to new_sessions_url
   end
end

def destroy
    logout!
    redirect_to new_sessions_url
end

end