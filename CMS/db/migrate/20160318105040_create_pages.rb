class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :content
      t.string :position, null: false

      t.timestamps null: false
    end
  end
end
