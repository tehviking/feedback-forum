# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
    
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def login_required 
    return true if user_signed_in? 
    session[:return_to] = request.request_uri 
    redirect_to new_user_session_path and return false
  end
end
