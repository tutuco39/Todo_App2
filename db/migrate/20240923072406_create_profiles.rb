class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :user_name
      t.string :department # 部署
      t.timestamps
    end
  end
end
