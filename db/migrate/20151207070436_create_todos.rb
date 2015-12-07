class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
