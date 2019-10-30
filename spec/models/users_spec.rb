require 'rails_helper'
RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_length_of(:password)} #.is_at_least(10)}
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :active }
    it { should validate_presence_of :role }
  end
end
