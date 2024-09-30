class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    # 既存のプロフィール、もしくは空を表示 userモデルに定義
    @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    redirect_to boards_path
  end

  private
  def profile_params
    params.require(:profile).permit(
      :user_name,
      :department,
      :avatar
    )
  end

end