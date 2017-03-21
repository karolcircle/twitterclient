require 'rails_helper'

describe TwitterAccount do 
  it "it cannot be saved more than 5 twitter accounts by the user" do
    user = FactoryGirl.create(:user)
       
    5.times do 
      TwitterAccount.create(name: "test", user_id: user.id)
    end

    sixth = TwitterAccount.create(name: "sixth", user_id: user.id)
   
    expect(sixth).to_not be_valid
    expect(sixth.errors.messages[:base]).to include("Only 5 Twitter Accounts allowed")
    expect(user.twitter_accounts.count).to eq 5
  end
end
