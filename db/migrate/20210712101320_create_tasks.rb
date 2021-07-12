class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :details
      t.integer :category_id
      t.date :due

      t.timestamps
    end
  end
end
