class DashboardController < ApplicationController
  def show
    @twitter_accounts = current_user.twitter_accounts
  end
end
