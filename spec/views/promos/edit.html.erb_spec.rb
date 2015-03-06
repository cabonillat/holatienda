require 'rails_helper'

RSpec.describe "promos/edit", type: :view do
  before(:each) do
    @promo = assign(:promo, Promo.create!(
      :title => "MyString",
      :content => "MyText",
      :product => "",
      :discount => 1
    ))
  end

  it "renders the edit promo form" do
    render

    assert_select "form[action=?][method=?]", promo_path(@promo), "post" do

      assert_select "input#promo_title[name=?]", "promo[title]"

      assert_select "textarea#promo_content[name=?]", "promo[content]"

      assert_select "input#promo_product[name=?]", "promo[product]"

      assert_select "input#promo_discount[name=?]", "promo[discount]"
    end
  end
end
