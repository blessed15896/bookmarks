class Account::SessionsController < ApplicationController
  def new
  end

  def create
    user = Account::User.find_by_email params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      log_in user
      redirect_to root_url
    else
      flash[:alert] = "Invalid email/password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end
end
