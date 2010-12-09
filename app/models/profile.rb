class Profile < ActiveRecord::Base
  belongs_to :user
  cattr_reader :per_page
  @@per_page = 20

  def name
    self.first_name + " " + self.last_name
  end
end
