class InterestedUsersController < ApplicationController
  def sign_up
    @interested_user = InterestedUser.new
    @interested_user.update_attributes!(interested_user_params)
    flash['success']= "Thanks for signing up! We will send you more information as we grow"
    redirect_to '/'
  rescue ActiveRecord::RecordInvalid
    flash['error']= "Invalid email."
    redirect_to '/'

  end

  private
  def interested_user_params
    params.require(:interested_user).permit(:email)
  end
end
