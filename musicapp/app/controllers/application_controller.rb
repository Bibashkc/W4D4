class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception
        helper_method :logged_in?
      def current_user
        User.find_by(session_token: session[:session_token])
      end

      def logged_in?
        !!current_user
      end
      def log_in_user!(user)
        session[:session_token] = user.reset_session_token!
      end
    
      def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
      end

      def ensure_logged_in
        redirect_to new_user_url unless logged_in?
      end
end