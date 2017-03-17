class TwittersController < ApplicationController

  def twitter_search
    if request.GET.include? "tag"
      tag = [params[:tag]]
      @search  = TwitterApi.client.search(tag.join(",")).take(10).collect
    end
  end

end
