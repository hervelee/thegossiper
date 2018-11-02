class AddColumnToLike < ActiveRecord::Migration[5.2]
  def change
  	add_reference :likes, :user, foreign_key: true
  	add_reference :likes, :likable, polymorphic: true, index: true  
  end
end
