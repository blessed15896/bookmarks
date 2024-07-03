class Account::UsersController < ApplicationController
  before_action :set_account_user, only: %i[ show edit update destroy ]

  # GET /account/users or /account/users.json
  def index
    @account_users = Account::User.all
  end

  # GET /account/users/1 or /account/users/1.json
  def show
  end

  # GET /account/users/new
  def new
    @account_user = Account::User.new
  end

  # GET /account/users/1/edit
  def edit
  end

  # POST /account/users or /account/users.json
  def create
    @account_user = Account::User.new(account_user_params)

    respond_to do |format|
      if @account_user.save
        format.html { redirect_to account_user_url(@account_user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @account_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/users/1 or /account/users/1.json
  def update
    respond_to do |format|
      if @account_user.update(account_user_params)
        format.html { redirect_to root_url, notice: "Profile updated successfully" }
        format.json { render :show, status: :ok, location: @account_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/users/1 or /account/users/1.json
  def destroy
    @account_user.destroy!

    respond_to do |format|
      format.html { redirect_to account_users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account_user
    @account_user = Account::User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def account_user_params
    params.require(:account_user).permit(:first_name, :last_name, :email, :date_of_birth, :photo)
  end
end
