class CreateTwitterAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :twitter_accounts do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
