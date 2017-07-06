class RemoveSrcFromImages < ActiveRecord::Migration[5.1]
  def change
    remove_column :images, :src
  end
end
