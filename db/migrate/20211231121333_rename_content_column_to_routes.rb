class RenameContentColumnToRoutes < ActiveRecord::Migration[6.1]
  def change
    rename_column :routes, :content, :content0
  end
end
