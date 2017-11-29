class AddAvatarToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :avatar, :string
  end
end
