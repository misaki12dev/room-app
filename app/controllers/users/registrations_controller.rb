class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, only: [:profile, :account, :profile_update]
  before_action :configure_account_update_params, only: [:profile_update]

  def profile
    if user_signed_in?
    @user = current_user
    else
      redirect_to new_user_session_path
    end
  end

  def profile_update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to profile_path
    else
      render root_path
    end
  end

  def account
    if user_signed_in?
    @user = current_user
    else
      redirect_to new_user_session_path
    end
  end

  def user_params
    params.require(:user).permit(:profile_image_id, :user_name, :user_introduction)
  end

  protected
  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:profile_update, keys: [:profile_image_id, :user_introduction])
  end

end
