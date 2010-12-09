namespace :devchix do
  desc "Create a user with fake data NUM=5"
  task :fakeuser  => :environment do |t, args|
    num_users = ENV['NUM'] || 1 
    puts "Making #{num_users} fakeusers"
    1.upto(num_users.to_i) do 
      u = User.create(:email => Faker::Internet.email, :password => "test123", :password_confirmation => "test123")
      u.update_attribute(:confirmed_at, Time.now)

      u.profile.first_name = Faker::Name.first_name
      u.profile.last_name = Faker::Name.last_name 
      u.profile.bio = Faker::Lorem.paragraph(4)
      u.profile.country = 'USA'
      u.profile.location = "#{Faker::Address.city}, #{Faker::Address.us_state_abbr}"
      years_ago = rand(10) + 30
      u.profile.birthday = Time.now - (years_ago.years)
      u.profile.save

      puts "added user #{u.profile.first_name} #{u.profile.last_name} from #{u.profile.location}"
    end
    puts "created #{num_users} fakeusers"
  end
end

