class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.string :title
      t.text :description
      t.date :deadline # 期限
      t.timestamps
    end
  end
end
