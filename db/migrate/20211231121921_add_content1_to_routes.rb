class AddContent1ToRoutes < ActiveRecord::Migration[6.1]
  def change
    add_column :routes, :content1, :text
    add_column :routes, :content2, :text
    add_column :routes, :content3, :text
    add_column :routes, :content4, :text
    add_column :routes, :content5, :text
    add_column :routes, :content6, :text
    add_column :routes, :content7, :text
    add_column :routes, :content8, :text
    add_column :routes, :content9, :text
  end
end
