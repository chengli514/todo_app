class AddParentIdToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :parent_id, :integer
  end
end
