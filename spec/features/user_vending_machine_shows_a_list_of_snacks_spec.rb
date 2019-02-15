require 'rails_helper'

RSpec.describe 'Vending machine show page', type: :feature do

  it 'shows all snacks the vending machine has' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack = dons.snacks.create(name: "food", price: 1234)

    visit machine_path(dons)
    expect(page).to have_content("food")
    expect(page).to have_content("cost: $1,234.00")
  end

  it 'shows the average price of snacks in a machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create(name: "food", price: 10.00)
    dons.snacks.create(name: "food", price: 5.00)

    visit machine_path(dons)

    expect(page).to have_content("Average Price: $7.50")
  end
end
