class Movie < ApplicationRecord
  validates_length_of :title, in: 1..50
  validates_inclusion_of :format, in: ['VHS', 'DVD', 'Streaming']

  validates_numericality_of :length, less_than: 501, greater_than: -1
  validates_numericality_of :release_year, less_than: 2101, greater_than: 1799
  validates_numericality_of :rating, less_than: 6, greater_than: -1

end
