require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :machine_snacks}
    it {should have_many(:snacks).through(:machine_snacks)}
  end

  describe 'instance methods' do

    it '.average_snack_price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack = dons.snacks.create(name: "food", price: 10.00)
      snack = dons.snacks.create(name: "food", price: 5.00)

      expect(dons.average_snack_price).to eq(7.50)
    end
  end

end
