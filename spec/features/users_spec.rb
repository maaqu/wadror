require 'spec_helper'

include OwnTestHelper

describe "User" do
  before :each do
    FactoryGirl.create :user
  end

  describe "who has signed up" do
    it "can signin with right credentials" do
      sign_in(username:"Pekka", password:"Foobar1")

      expect(page).to have_content 'Welcome back!'
      expect(page).to have_content 'Pekka'
    end

    it "is redirected back to signin form if wrong credentials given" do
      sign_in(username:"Pekka", password:"wrong")

      expect(current_path).to eq(signin_path)
      expect(page).to have_content 'username and password do not match'
    end
  end

  it "when signed up with good credentials, is added to the system" do
    visit signup_path
    fill_in('user_username', with:'Brian')
    fill_in('user_password', with:'Secret55')
    fill_in('user_password_confirmation', with:'Secret55')

    expect{
      click_button('Create User')
    }.to change{User.count}.by(1)
end
    it "shows user's ratings in users[:id]" do
      sign_in(username:"Pekka", password:"Foobar1")
      FactoryGirl.create :brewery, name:"Koff"
      FactoryGirl.create :beer, name:"iso 3"
      visit new_rating_path
      select('iso 3', from:'rating[beer_id]')
      fill_in('rating[score]', with:'15')
      click_button "Create Rating"
      visit user_path(1)
      expect(page).to have_content "has made 1 rating"
      expect(page).to have_content "iso 3 15"
    end
  end