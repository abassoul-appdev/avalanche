require 'open-uri'
class Skier < ApplicationRecord
  before_validation :geocode_home_mountain

  def geocode_home_mountain
    if self.home_mountain.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.home_mountain)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.home_mountain_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.home_mountain_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.home_mountain_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :avalanche_infos,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
