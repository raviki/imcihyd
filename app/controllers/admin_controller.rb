class AdminController < ApplicationController
  layout "admin"
  
 # redirect_to sessions_path
  
  def pagination_page
    params[:page] ||= 1
    params[:page].to_i
  end

  def pagination_rows
    params[:rows] ||= 10
    params[:rows].to_i
  end
  
  def store_location
    session[:return_to] = request.env["HTTP_REFERER"] 
    
  end

  def redirect_back_or(default, hsh = {})
     redirect_to(session[:return_to] || default, hsh )
     clear_return_to
  end

  def clear_return_to
   session[:return_to] = nil
  end
  
end
