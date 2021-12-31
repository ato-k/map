class AddStartToRoutes < ActiveRecord::Migration[6.1]
  def change
    add_column :routes, :start, :string
  end
end
