class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets, dependent: :destroy
  validates_length_of :tweets, maximum: 10

  validate :twitter_accounts_limit, on: :create

  def twitter_accounts_limit
    if self.user.twitter_accounts.count >= 5
      errors.add(:base, "Only 5 Twitter Accounts allowed")
    end
  end
end
