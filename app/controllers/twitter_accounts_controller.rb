class TwitterAccountsController < ApplicationController

  before_action :authenticate_user!

  def new
    @twitter_account = TwitterAccount.new
  end

  def create
    @twitter_account = TwitterAccount.new(twitter_account_params)
    @twitter_account.user_id = current_user.id
    if @twitter_account.save
      id = @twitter_account.id
      DeliverTweetsService.deliver_tweets(id)
      redirect_to @twitter_account
    else
      render :new
    end
  end

  def refresh_button
    @twitter_account = TwitterAccount.find(params[:id])
    id = @twitter_account.id
    DeliverTweetsService.deliver_tweets(id)
    redirect_to :back
  end

  def show
    @twitter_account = TwitterAccount.find(params[:id])
    @result = Tweet.where("twitter_account_id = ?", params[:id])
  end

  def destroy
    @twitter_account = TwitterAccount.find(params[:id])
    @twitter_account.destroy
    redirect_to :back
  end

private

  def twitter_account_params
    params.require(:twitter_account).permit(:name, :user_id)
  end

end
