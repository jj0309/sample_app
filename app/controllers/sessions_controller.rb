class SessionsController < ApplicationController
  def new
  end

  def create
    # attempts to find the user by email
    user = User.find_by_email(params[:session][:email].downcase)
    #if user exists/found, attempt to authenticate using the password provided
    if(user && user.authenticate(params[:session][:password]))
      sign_in user
      redirect_to user
    else
      #flash vs flash.now
      #use flash.now if you're gonna render a page
      #use flash if you're gonna redirect
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
