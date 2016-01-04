class AddIsTopLevelToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :is_top_level, :boolean, :default => false
  end
end
