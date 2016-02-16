class InterestedUsersController < ApplicationController
  def sign_up
    @interested_user = InterestedUser.new
    params = interested_user_params
    if InterestedUser.where(email: params['email']).blank?
      @interested_user.update_attributes!(params)
      flash['success']= "Thanks for signing up! We will send you more information as we grow"
    else
      flash['notice']= "The email you entered is already on our testers list."
    end
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
