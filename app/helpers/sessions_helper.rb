module SessionsHelper
    
    # Logs in the given user.
    def log_in(user)
        session[:user_id] = user.id
    end
    
    #returns the currnt logged-in user (if any)
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    # Retruns true if thes user is logged in, false otherwise
    def logged_in?
        !current_user.nil?
    end
    
    #Logs out the current user.
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
