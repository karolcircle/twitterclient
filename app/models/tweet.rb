class Tweet < ApplicationRecord
  belongs_to :twitter_account
  validates_associated :twitter_account
end
