# This migration comes from admin_engine (originally 20090714000000)
class CreateFavorites < ActiveRecord::Migration
  
  def self.up
    create_table :favorites do |t|
      t.string :title
      t.string :url
      t.integer :user_id
    end
    
    add_index :favorites, :user_id
    
  end
  
  def self.down
    drop_table :favorites
  end
  
end