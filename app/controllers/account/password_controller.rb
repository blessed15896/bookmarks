class Account::PasswordController < ApplicationController
  def new
  end

  def edit
  end

  def update
  end

  private

  def account_user_params
    params.require(:account_user).permit(:password, :password_confirmation)
  end
end
