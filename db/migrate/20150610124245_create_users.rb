class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps null: false
    end
    def change
      create_table :locations do |t|
        t.belongs_to :user, index: true
        t.float :latitude
        t.float :longitude
        t.timestamps null: false
      end
      add_index :locations, :user_id, :unique => true
  end
end
