class CreateAlbumsImages < ActiveRecord::Migration
  def change
    create_table :albums_images, id: false do |t|
      t.references :album
      t.references :images
    end
    add_index :albums_images, [:album_id, :images_id]
    add_foreign_key :albums_images, :albums
    add_foreign_key :albums_images, :images
  end
end