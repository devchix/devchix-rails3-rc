module ProfilesHelper
  def full_name(profile) 
   "#{profile.first_name} #{profile.last_name}"
  end

end
