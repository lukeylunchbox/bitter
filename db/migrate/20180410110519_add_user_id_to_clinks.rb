class AddUserIdToClinks < ActiveRecord::Migration[5.1]
  def change
    add_column :clinks, :user_id, :integer
  end
end
