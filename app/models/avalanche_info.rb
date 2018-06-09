class AvalancheInfo < ApplicationRecord
  # Direct associations

  belongs_to :skier,
             :counter_cache => true

  # Indirect associations

  # Validations

end
