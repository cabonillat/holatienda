class Promo < ActiveRecord::Base
	validates_presence_of :title, :product, :discount
	validates_numericality_of :discount, 
		{ greater_than: 0, less_than: 100 }

	belongs_to :product

end
