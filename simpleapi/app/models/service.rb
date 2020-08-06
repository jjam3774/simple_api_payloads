class Service < ApplicationRecord
    validates :payload, presence: true
    validates :body, presence: true
end
