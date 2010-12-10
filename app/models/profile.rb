class Profile < ActiveRecord::Base
  belongs_to :user
  cattr_reader :per_page
  @@per_page = 20

  def name
    self.first_name + " " + self.last_name
  end

  def self.search(search)  
    if search  
      where('first_name LIKE ? or last_name LIKE ?', "%#{search}%", "%#{search}%")  
    else  
      scoped  
    end  
  end  

end
