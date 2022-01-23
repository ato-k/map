class AddImpressionsCountToRoutes < ActiveRecord::Migration[6.1]
  def change
    add_column :routes, :impressions_count, :integer, default: 0
  end
end
