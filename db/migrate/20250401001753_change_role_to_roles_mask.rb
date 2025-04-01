class ChangeRoleToRolesMask < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :role
    add_column :users, :roles_mask, :integer, default: 0
  end
end
