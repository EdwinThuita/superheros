class HeroPower < ApplicationRecord
    validates :strength,
              {
                inclusion: {
                  in: %w[Strong Weak Average],
                  message:
                    "The strength must be either 'Strong', 'Weak' or 'Average'",
                },
                presence: true,
              }
    belongs_to :hero
    belongs_to :power
  end