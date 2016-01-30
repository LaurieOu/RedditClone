class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username],
                                    params[:user][:password])
    p "THIS IS THE CLASS: #{user.class} and USER IS #{user} "

    if user
      log_in!(user)
      redirect_to user_url(user)
    else
      flash.now[:error] = ["Incorrect password and/or username"]
      render :new
    end
  end


  def destroy
    log_out
    redirect_to new_session_url
  end

end
