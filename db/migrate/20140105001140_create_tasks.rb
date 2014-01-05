class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.float :time_estimate
      t.float :time_spent
      t.integer :difficulty
      t.boolean :completed
      t.string :status
      t.references :project

      t.timestamps
    end
    add_index :tasks, :project_id
  end
end
