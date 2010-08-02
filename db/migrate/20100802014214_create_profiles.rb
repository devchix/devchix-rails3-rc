class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :location
      t.text :bio
      t.date :birthday
      t.string :linkedin
      t.string :twitter
      t.string :facebook
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
