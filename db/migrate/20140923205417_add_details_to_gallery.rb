class AddDetailsToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :name, :string
    add_column :galleries, :description, :string
    add_column :galleries, :cover, :string
  end
end
