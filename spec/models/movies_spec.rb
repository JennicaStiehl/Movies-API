require 'rails_helper'
RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:format)}
    it { should validate_presence_of(:length)}
    it { should validate_presence_of(:release_year)}
    it { should validate_presence_of(:rating)}
  end
end
# a. Title [text; length between 1 and 50 characters]
# b. Format [text; allowable values “VHS”, “DVD”, “Streaming”]
# c. Length [time; value between 0 and 500 minutes]
# d. Release Year [integer; value between 1800 and 2100]
# e. Rating [integer; value between 1 and 5]
