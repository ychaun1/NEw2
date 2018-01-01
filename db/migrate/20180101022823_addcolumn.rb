class Addcolumn < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :checkbox, :boolean
  end
end
