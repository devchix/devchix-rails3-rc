require 'spec_helper'

describe "profiles/index.html.haml" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :user_id => 1,
        :first_name => "First Name",
        :last_name => "Last Name",
        :country => "Country",
        :location => "Location",
        :bio => "MyText"
      ),
      stub_model(Profile,
        :user_id => 1,
        :first_name => "First Name",
        :last_name => "Last Name",
        :country => "Country",
        :location => "Location",
        :bio => "MyText"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "First Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Last Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Country".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Location".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
