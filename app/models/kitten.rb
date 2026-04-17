class Kitten < ApplicationRecord
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cuteness, numericality: true
  validates :softness, numericality: true
end
