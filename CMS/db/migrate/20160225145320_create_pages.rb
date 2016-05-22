class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
    	t.string :title, null: false
    	t.text :body, null: false
    	t.integer :user_id, null: false

    	t.timestamps null: false
    end

    add_index :pages, :user_id
  end
end
