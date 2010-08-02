require 'spec_helper'

describe "profiles/show.html.haml" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :user_id => 1,
      :first_name => "First Name",
      :last_name => "Last Name",
      :country => "Country",
      :location => "Location",
      :bio => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain("First Name".to_s)
    rendered.should contain("Last Name".to_s)
    rendered.should contain("Country".to_s)
    rendered.should contain("Location".to_s)
    rendered.should contain("MyText".to_s)
  end
end
