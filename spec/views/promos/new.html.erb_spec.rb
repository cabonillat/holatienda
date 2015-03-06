require 'rails_helper'

RSpec.describe "promos/new", type: :view do
  before(:each) do
    assign(:promo, Promo.new(
      :title => "MyString",
      :content => "MyText",
      :product => "",
      :discount => 1
    ))
  end

  it "renders new promo form" do
    render

    assert_select "form[action=?][method=?]", promos_path, "post" do

      assert_select "input#promo_title[name=?]", "promo[title]"

      assert_select "textarea#promo_content[name=?]", "promo[content]"

      assert_select "input#promo_product[name=?]", "promo[product]"

      assert_select "input#promo_discount[name=?]", "promo[discount]"
    end
  end
end
