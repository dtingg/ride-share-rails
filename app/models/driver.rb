class Driver < ApplicationRecord
  has_many :trips, dependent: :nullify
  
  validates :name, presence: true
  validates :vin, presence: true
  
  def self.get_available_driver
    first_available = Driver.where(available: true).first
    return first_available
  end
  
  # Average rating
  
  # Total earnings
  
  # Can go online
  
  # Can go offline
end
