class AddMembersOnlyToBlogPosts < ActiveRecord::Migration
  def self.up
    add_column Refinery::Blog::Post.table_name, :members_only, :boolean
  end

  def self.down
    remove_column Refinery::Blog::Post.table_name, :members_only
  end
end