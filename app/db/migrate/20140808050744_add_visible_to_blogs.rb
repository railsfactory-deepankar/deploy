class AddVisibleToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :visible, :boolean
  end
end
