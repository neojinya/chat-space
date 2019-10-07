class UserController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
  end

  def flash
    flash[:succcess] = アカウントが登録されました。
    flash[:rogin_m] = ログインしました。
    flash[:rogout_m] = ログインまたは登録が必要です。
  end


  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
