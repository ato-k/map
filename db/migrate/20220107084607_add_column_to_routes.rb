class AddColumnToRoutes < ActiveRecord::Migration[6.1]
  def change
    add_reference :routes, :user, foreign_key: true

    add_index :routes, [:user_id, :created_at]
  end
end
