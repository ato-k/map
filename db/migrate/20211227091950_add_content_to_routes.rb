class AddContentToRoutes < ActiveRecord::Migration[6.1]
  def change
    add_column :routes, :content, :text
  end
end
