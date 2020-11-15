class Cake < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    belongs_to :user
    has_many :sales

    validates_numericality_of :price,
    greater_than: 10, message: "Price must be atleast 10€"

end
