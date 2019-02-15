require 'rails_helper'

RSpec.describe 'Snack Show page', type: :feature do

  it 'Visitor can go to the snack show page' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack = dons.snacks.create(name: "food", price: 10.00)
    dons.snacks.create(name: "food", price: 5.00)
    visit snack_path(snack)

    expect(current_path).to eq(snack_path(snack))
    expect(page).to have_content("Welcome")
  end

  it 'shows basic information about the snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack = dons.snacks.create(name: "food", price: 10.00)
    dons.snacks.create(name: "food", price: 5.00)
    visit snack_path(snack)

    expect(page).to have_content("Price: $10.00")
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Average price: $7.50")
    expect(page).to have_content("Machine has 2 items")
  end

end
