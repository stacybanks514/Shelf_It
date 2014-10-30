class UsersController < ApplicationController
# skip_before_action :require_signin, only: [:new, :create]
 
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      sign_in @user
      redirect_to @user #goes to user - show.html.erb
    else 
      render :new     #rails will look in views folder for new.html.erb
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      redirect_to @user
      flash[:notice] = "Updated User Successfully!"
    else
      render :edit
    end
  end

  def destroy
  end


private

  def users_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

end