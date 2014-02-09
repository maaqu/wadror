require 'spec_helper'

describe "Beer" do
  before :each do
    FactoryGirl.create :brewery
    FactoryGirl.create :user
  end
  it "when created with a valid name is saved" do
    sign_in(username:"Pekka", password:"Foobar1")
    visit new_beer_path
    fill_in('Name', with:'testiolut')
    select('Weizen', from:'Style')
    select('anonymous', from:'Brewery')
    expect{
      click_button "Create Beer"
    }.to change{Beer.count}.from(0).to(1)
  end
  it "is not created and returns the user to the beer creation page when it has an invalid name" do
    sign_in(username:"Pekka", password:"Foobar1")
    visit new_beer_path
    select('Weizen', from:'Style')
    select('anonymous', from:'Brewery')
    click_button "Create Beer"
    expect(current_path).to eq(beers_path)
    expect(page).to have_content "Name can't be blank"
    expect(Beer.count).to eq(0)
  end


end