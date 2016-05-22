class ChangePagesLogic < ActiveRecord::Migration
  def change
    remove_column :pages, :position
  end
end
