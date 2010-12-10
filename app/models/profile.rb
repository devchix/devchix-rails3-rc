class Profile < ActiveRecord::Base
  belongs_to :user
  cattr_reader :per_page
  @@per_page = 20

  def name
    self.first_name + " " + self.last_name
  end

  def self.search(search_field, search_value)  
    if search_field == "name"  
      where('first_name LIKE ? or last_name LIKE ?', "%#{search_value}%", "%#{search_value}%")  
    elsif search_field == "location"  
      where('location LIKE ?', "%#{search_value}%")  
    else  
      scoped  
    end  
  end  

end
