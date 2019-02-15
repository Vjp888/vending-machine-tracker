require 'rails_helper'

RSpec.describe 'Vending machine show page', type: :feature do

  it 'shows all snacks the vending machine has' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack = dons.snacks.create(name: "food", price: 1234)

    visit machine_path(dons)
    expect(page).to have_content("food")
    expect(page).to have_content("1234")
  end
end
