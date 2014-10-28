class SessionsController < ApplicationController
skip_before_action only: [:new, :create]

  def new #this is the sign in
    
  end

  def create
    # find user by their email
    user = User.find_by(email: params[:session][:email].downcase)

    # test if the user was found and authenticates
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to user
    else
      flash[:error] = "Invalid email/password"
      redirect_to new_session_path
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
