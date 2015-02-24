class RenameImagesIdOnAlbumsImages < ActiveRecord::Migration
  def up
    change_table :albums_images do |t|
      # t.rename :album_id, :albums_id
      t.rename :images_id, :image_id
      # t.remove_foreign_key :album
    end
    # remove_index :albums_images, [:album_id, :images_id]
    # add_index :albums_images, [:albums_id, :images_id]    
  end


  def down
    change_table :albums_images do |t|
      # t.rename :albums_id, :album_id 
      t.rename :image_id, :images_id
    end
    # remove_index :albums_images, [:albums_id, :images_id]
    # add_index :albums_images, [:album_id, :images_id]
  end
end
