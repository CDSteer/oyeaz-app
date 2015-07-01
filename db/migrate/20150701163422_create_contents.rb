class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
