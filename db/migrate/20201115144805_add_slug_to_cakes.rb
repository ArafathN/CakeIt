class AddSlugToCakes < ActiveRecord::Migration[6.0]
  def change
    add_column :cakes, :slug, :string
    add_index :cakes, :slug, unique: true
  end
end
