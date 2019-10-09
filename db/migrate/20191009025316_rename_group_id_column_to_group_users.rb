class RenameGroupIdColumnToGroupUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :group_users, :group_id_id, :group_id
  end
end
 