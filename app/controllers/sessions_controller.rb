class SessionsController < ApplicationController

  def new
    @admin = Admin.new
  end

  def create
    admin_params = params.require(:admin).permit(:email, :password)
    @admin = Admin.confirm(admin_params)
    if @admin
      login(@admin)
      flash[:notice] = "Successfully logged in."
      redirect_to @admin
    else
      flash[:error] = "Incorrect email or password."
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end

end
