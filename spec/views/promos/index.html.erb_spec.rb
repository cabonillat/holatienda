require 'rails_helper'

RSpec.describe "promos/index", type: :view do
  before(:each) do
    assign(:promos, [
      Promo.create!(
        :title => "Title",
        :content => "MyText",
        :product => "",
        :discount => 1
      ),
      Promo.create!(
        :title => "Title",
        :content => "MyText",
        :product => "",
        :discount => 1
      )
    ])
  end

  it "renders a list of promos" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
