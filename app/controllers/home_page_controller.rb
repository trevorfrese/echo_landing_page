class HomePageController < ApplicationController
  def home
  end

  def interested_users_home
    @interested_user = InterestedUser.new
  end
end
