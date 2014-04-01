# This migration comes from admin_engine (originally 20090414000000)
class InstallAdmin < ActiveRecord::Migration
  def self.up
    create_table :configurations do |t|
      t.string   :name
      t.text     :value
      t.timestamps
    end
    
    create_table :sessions do |t|
      t.string :session_id, :null => false
      t.text :data
      t.timestamps
    end

    add_index :sessions, :session_id
    add_index :sessions, :updated_at
  end

  def self.down
    drop_table   :sessions
    drop_table   :configurations
  end
end
