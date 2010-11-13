class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  has_one :profile
  after_create :build_profile

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

   # so users can login by email or username, not tested yet
   # to look up a user by email or username
   def self.find_for_authentication(conditions={})
    if conditions[:login] =~ /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i # email regex
      conditions[:email] = conditions[:login]
      conditions.delete("login")
    end
    super
  end
  
  private
  def build_profile
    # tried using self.build_profile but didn't work. Meh. moving on
    self.profile = Profile.new
    self.profile.save(:validate => false) 
  end
end
