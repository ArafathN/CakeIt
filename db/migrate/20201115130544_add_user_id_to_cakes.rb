class AddUserIdToCakes < ActiveRecord::Migration[6.0]
  def change
    add_column :cakes, :user_id, :integer
  end
end
