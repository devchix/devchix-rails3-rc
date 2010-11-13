class Profile < ActiveRecord::Base
  belongs_to :user

  def name
    self.first_name + " " + self.last_name
  end
end
