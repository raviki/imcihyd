class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def robots                                                                                                                                      
  robots = File.read(Rails.root + "config/robots.#{Rails.env}.txt")
  render :text => robots, :layout => false, :content_type => "text/plain"
  end

  private
  def pagination_page
    params[:page] ||= 1
    params[:page].to_i
  end

  def pagination_rows
    params[:rows] ||= 16
    params[:rows].to_i
  end
  
  def require_user
    if !current_user
      redirect_to login_path 
      cookies.delete(:require_user_page) 
    else      
      cookies[:require_user_page] = true
    end
  end
  
  def store_location(next_page = nil, proceed = false)
    
  end

  def redirect_back_or(default, hsh = {})
    redirect_to(session[:return_to] || default, hsh )
    clear_return_to
  end

  def clear_return_to
    session[:return_to] = nil
  end


  def current_user
    rem_token_cookie = cookies[:remember_token]
    if cookies[:remember_token]
      encrypted_token  = Digest::SHA1.hexdigest(rem_token_cookie.to_s)
      @current_user ||= User.find_by(:remember_token => encrypted_token)
      return @current_user
    else
      if session[:customer_id]
        @current_user ||= User.find(session[:customer_id]) 
        return @current_user
      else
        return nil
      end 
    end
  end

  
end
