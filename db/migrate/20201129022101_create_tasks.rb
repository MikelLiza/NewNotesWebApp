class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.belongs_to :note, index: true, foreign_key: true, null: false
      t.string :title, null: false

      t.timestamps null:false
    end
  end
end
