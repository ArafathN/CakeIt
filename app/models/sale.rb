class Sale < ApplicationRecord
    before_create :populate_uuid
    belongs_to :book

    validates_numericality_of :price
    greater_than 1, message: "Price must be atleast 1€"

    private
    def populate_uuid
        self.uuid = SecureRandom.uuid()
    end

end
