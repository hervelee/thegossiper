class AddColumnToComment < ActiveRecord::Migration[5.2]
  def change
  	def change
  	add_column :comments, :author, :string
  	add_column :comments, :content, :text
  	add_reference :comments, :gossip, foreign_key:true 
  end

end
