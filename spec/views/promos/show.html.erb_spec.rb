require 'rails_helper'

RSpec.describe "promos/show", type: :view do
  before(:each) do
    @promo = assign(:promo, Promo.create!(
      :title => "Title",
      :content => "MyText",
      :product => "",
      :discount => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end
