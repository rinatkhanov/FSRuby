class AddStaticToPages < ActiveRecord::Migration
  def change
    add_column :pages, :static, :boolean
  end
end
