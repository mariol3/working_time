class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize, :admin_section
  
  protected
  
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
    
    def admin_section
      if session[:user_id]
        unless session[:user_id] == 1
          redirect_to work_days_url, notice: "Non hai i diritti per accedere alla risorsa indicata"
        end
      end
    end
end
