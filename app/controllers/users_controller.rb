class UsersController < ApplicationController
  before_action :set_user, only: %i( show edit update destroy )
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "ユーザーを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path, notice: "ユーザーを削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
