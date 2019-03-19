  class Gym < ApplicationRecord
    belongs_to :user
     mount_uploader :photo, PhotoUploader
     #adding geocoder config
    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?


    validates :name, presence: true , uniqueness: true
    validates :description, presence: true
    validates :description, length: { minimum: 15 }
    validates :pricing, presence: true
    validates :address , presence: true
    #para poder añadir en nuestro modelr
  end
