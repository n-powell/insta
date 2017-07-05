class AddImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :src, null: false, default: ""
      t.string :title, null: false, default: ""
      t.integer :user_id
      t.timestamps
    end
  end
end
