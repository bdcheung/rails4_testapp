# This migration comes from admin_engine (originally 20111130195432)
class CreateIpPasslistTable < ActiveRecord::Migration
  def self.up
    create_table :ip_passlists do |t|
      t.string :ip
      t.string :description
      t.date :expiration
    end

    add_index :ip_passlists, :ip, :unique => true
  end

  def self.down
    drop_table :ip_passlists
  end
end
