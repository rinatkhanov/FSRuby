class AddIndexToPageAndUrl < ActiveRecord::Migration
  def change
    add_column :pages, :index, :integer, default: 0,  null: false
    add_column :pages, :url,   :string,  default: "", null: false
  end
end
