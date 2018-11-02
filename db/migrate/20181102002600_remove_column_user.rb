class RemoveColumnUser < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :email
  	remove_column :users, :confirmed
  	remove_column :users, :password_digest
  	remove_column :users, :confirmation_token
  	remove_column :users, :firstname
  	remove_column :users, :lastname


 end
end
