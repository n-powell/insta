class AddComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :text, null: false, default: ""
      t.integer :user_id
      t.integer :image_id
      t.timestamps
    end
  end
end
