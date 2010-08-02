# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :profile do |f|
  f.user_id 1
  f.first_name "MyString"
  f.last_name "MyString"
  f.country "MyString"
  f.location "MyString"
  f.bio "MyText"
  f.birthday "2010-08-01"
end
