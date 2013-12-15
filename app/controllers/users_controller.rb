class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @page_title = @user.name
  end

  def new
    @page_title = "Sign Up"
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Account created, welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, 
                                   :password_confirmation)
    end
end
