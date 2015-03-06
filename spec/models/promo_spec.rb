require 'rails_helper'

RSpec.describe Promo, type: :model do
  
	context 'when saving promo' do

		it 'without a title' do
			promo = Promo.create()
			expect(promo.persisted?).to be false
			expect(promo).to have(1).error_on(:title)
		end

		it 'without a product' do
			promo = Promo.create()
			expect(promo.persisted?).to be false
			expect(promo).to have(1).error_on(:product)
		end

		it 'without a discount' do
			promo = Promo.create()
			expect(promo.persisted?).to be false
			expect(promo).to have(2).error_on(:discount)
		end

		it 'with 200 discount' do
			promo = Promo.create(discount: 200)
			expect(promo.persisted?).to be false
			expect(promo).to have(1).error_on(:discount)
		end
		
	end

end
