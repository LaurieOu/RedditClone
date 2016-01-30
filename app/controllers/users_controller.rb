class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      # flash[:message] = ["Congrats for signing up"]
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  private
  def users_params
    params.require(:user).permit(:username, :password)
  end
end
