class CreateToDos < ActiveRecord::Migration[5.0]
  def change
    create_table :to_dos do |t|
      t.string :task
      t.integer :priority
      t.datetime :due_date

      t.timestamps
    end
  end
end
