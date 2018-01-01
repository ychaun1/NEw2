class ChangeAttribute < ActiveRecord::Migration[5.1]
  def change
    rename_column :lists, :checkbox, :check
  end
end
