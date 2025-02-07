class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_prams)
    if @user.save
      reset_session
      login(@user)
      flash[:success] = "Created User Account Successfly"
      redirect_to @user
    else
      render "new", status: :unprocessable_entity   # code 422
    end
  end

  private

    def user_prams
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    
end
