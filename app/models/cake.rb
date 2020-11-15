class Cake < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    belongs_to :user
    has_many :sales


end
