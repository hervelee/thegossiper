class AddColumnToComment3 < ActiveRecord::Migration[5.2]
  def change
  	add_reference :comments, :user, foreign_key: true
  	add_reference :comments, :commentable, polymorphic: true, index: true  
  end
end
