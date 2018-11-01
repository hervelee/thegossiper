class AddColumnToGossip < ActiveRecord::Migration[5.2]
  def change
  	add_column :gossips, :author, :string
  	add_column :gossips, :content, :text
  	add_reference :gossips, :user, foreign_key:true 

  end
end
