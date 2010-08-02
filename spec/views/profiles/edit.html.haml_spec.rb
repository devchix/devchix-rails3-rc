require 'spec_helper'

describe "profiles/edit.html.haml" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :new_record? => false,
      :user_id => 1,
      :first_name => "MyString",
      :last_name => "MyString",
      :country => "MyString",
      :location => "MyString",
      :bio => "MyText"
    ))
  end

  it "renders the edit profile form" do
    render

    rendered.should have_selector("form", :action => profile_path(@profile), :method => "post") do |form|
      form.should have_selector("input#profile_user_id", :name => "profile[user_id]")
      form.should have_selector("input#profile_first_name", :name => "profile[first_name]")
      form.should have_selector("input#profile_last_name", :name => "profile[last_name]")
      form.should have_selector("input#profile_country", :name => "profile[country]")
      form.should have_selector("input#profile_location", :name => "profile[location]")
      form.should have_selector("textarea#profile_bio", :name => "profile[bio]")
    end
  end
end
