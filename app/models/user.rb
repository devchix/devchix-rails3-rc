class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  has_one :profile
<<<<<<< HEAD
  after_create :build_profile
=======
  after_create :create_user_profile
>>>>>>> 9b5f9e90e7094fa8e2bf067b8377c462dbe49dc8

  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
<<<<<<< HEAD
  
=======


   # to look up a user by email or username
>>>>>>> 9b5f9e90e7094fa8e2bf067b8377c462dbe49dc8
   def self.find_for_authentication(conditions={})
    if conditions[:login] =~ /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i # email regex
      conditions[:email] = conditions[:login]
      conditions.delete("login")
    end
    super
  end
<<<<<<< HEAD
  
  def build_profile
    # tried using self.build_profile but didn't work. Meh. moving on
    self.profile = Profile.new
    self.profile.save(:validate => false) 
=======

  private

  def create_user_profile
    self.profile = Profile.new
    self.profile.save(false)  #save without validating
>>>>>>> 9b5f9e90e7094fa8e2bf067b8377c462dbe49dc8
  end
end
