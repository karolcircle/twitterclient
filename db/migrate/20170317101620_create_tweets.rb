class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.text :text
      t.references :twitter_account, foreign_key: true

      t.timestamps
    end
  end
end
