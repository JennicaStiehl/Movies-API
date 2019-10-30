require 'rails_helper'
RSpec.describe Movie, type: :model do
  before :each do
    batman = Movie.create(title: "Batman", format: "DVD", length: 150, release_year: 1997, rating: 5)
  end

  describe 'validations' do
    it { should validate_length_of(:title).is_at_least(1).is_at_most(50)}
    it { should validate_inclusion_of(:format).in_array(['VHS', 'DVD', 'Streaming'])}

    it { should validate_numericality_of(:length).is_greater_than(-1)}
    it { should validate_numericality_of(:length).is_less_than(501)}
    it { should validate_numericality_of(:release_year).is_greater_than(1799)}
    it { should validate_numericality_of(:release_year).is_less_than(2101)}
    it { should validate_numericality_of(:rating).is_greater_than(-1)}
    it { should validate_numericality_of(:rating).is_less_than(6)}
  end
end
# a. Title [text; length between 1 and 50 characters]
# b. Format [text; allowable values “VHS”, “DVD”, “Streaming”]
# c. Length [time; value between 0 and 500 minutes]
# d. Release Year [integer; value between 1800 and 2100]
# e. Rating [integer; value between 1 and 5]
