class RenameUserIdColumnToGroupUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :group_users, :user_id_id, :user_id
  end
end
