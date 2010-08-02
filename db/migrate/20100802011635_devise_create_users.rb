class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :username, :limit => 15
      t.database_authenticatable :null => false
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :confirmation_token,   :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :users
  end
end
