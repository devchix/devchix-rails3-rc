class AddProfileIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :profile_id, :integer
  end

  def self.down
    remove_column :users, :profile_id
  end
end
