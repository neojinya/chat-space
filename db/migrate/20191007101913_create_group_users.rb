class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.references   :user_id, foreigin_key: true
      t.references   :group_id, freigin_key: true
      t.timestamps   
    end
  end
end
