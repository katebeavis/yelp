require 'rails_helper'

feature 'reviewing' do


  context "user not signed in and on the restaurant page" do

    before do
      Restaurant.create(name: 'KFC')
    end

    xscenario "only lets users leave a review if the're signed in" do
      visit ('/restaurants')
      click_link ('Review KFC')
      expect(page).to have_content "Log in"
    end

  end

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
    click_link 'Add a restaurant'
    fill_in 'Name', with: 'KFC'
    click_button 'Create Restaurant'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
  end

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  scenario 'allows reviews to be deleted when associated restaurant is deleted' do
    visit '/restaurants'
    click_link 'Delete KFC'
    expect(current_path).to eq '/restaurants'
    expect(page).to_not have_content('so so')
  end

  scenario 'can only be left by a user on the same restaurant once' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(page).to have_content("You have already reviewed this restaurant")
  end

end