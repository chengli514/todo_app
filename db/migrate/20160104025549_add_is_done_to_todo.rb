class AddIsDoneToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :is_done, :boolean
  end
end
