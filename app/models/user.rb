class User < ActiveRecord::Base
  has_one :profile

  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

   def self.find_for_authentication(conditions={})
    if conditions[:login] =~ /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i # email regex
      conditions[:email] = conditions[:login]
      conditions.delete("login")
    end
    super
  end
end
