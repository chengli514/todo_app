class RemoveTextFromTodo < ActiveRecord::Migration
  def change
    remove_column :todos, :text, :text
  end
end
