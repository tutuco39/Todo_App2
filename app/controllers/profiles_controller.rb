class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = current_user.build_profile
  end

  def create
    Rails.logger.info params.inspect
    @profile = current_user.build_profile(profile_params)
    if @profile.save
        redirect_to boards_path,
        notice: 'アバターを登録しました'
    else
        render :new
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.assign_attributes(profile_params)
    redirect_to boards_path,
    notice: 'アバターを更新しました'
  end

  private
  def profile_params
    params.require(:profile).permit(:avatar)
  end

end
