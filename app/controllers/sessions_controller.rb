class SessionsController < ApplicationController
   def new
      store_location()
  end
  

 def create
  if env["omniauth.auth"].present?  
        facebook_callback()
  else
   
   user = User.find_by(:email => params[:session][:session_login])
    
   # user = user.downcase
   if user
    @user_hash= BCrypt::Password.new(user.encrypted_password)
    if @user_hash == params[:session][:password]
      remember_token = user.new_remember_token
      session[:user_id] = user.id
      if params[:session][:remember_me]
        cookies.permanent[:remember_token] = remember_token
      else
        cookies[:remember_token] = remember_token
      end
      encrypted_token = user.encrypt_token(remember_token)
      user.update_columns(remember_token: encrypted_token)
        redirect_back_or(root_url, :success  => "Logged In!!")   
    else
     #puts "#{user_hash} this is not #{params.inspect}"
     flash[:notice] = 'Invalid Email / Password Combination. Enter valid data/Reset Your Password' # Not quite right!
     render "new"
    end
   else 
     # Create an error message and re-render the signin form.
     flash[:notice] = 'Invalid Email / Password Combination' # Not quite right!
     render 'new'
   end
  end
end
end
