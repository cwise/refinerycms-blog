class CreateBlogTranslationTables < ActiveRecord::Migration

  def self.up
    Refinery::Blog::Post.create_translation_table!({
      :title => :string,
      :body => :text,
      :custom_teaser => :text      
    }, :migrate_data => true)

    remove_column Refinery::Blog::Post.table_name, :title
    remove_column Refinery::Blog::Post.table_name, :body    
    remove_column Refinery::Blog::Post.table_name, :custom_teaser    
  end

  def self.down
    add_column Refinery::Blog::Post.table_name, :title, :string
    add_column Refinery::Blog::Post.table_name, :body, :text
    add_column Refinery::Blog::Post.table_name, :custom_teaser, :text

   Refinery::Blog::Post.table_name.drop_translation_table! :migrate_data => true
  end
end