require 'rails_helper'

  def leave_review(thoughts, rating)
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'so so'
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

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
    fill_in('Email', with: 'test@another.com')
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

  scenario 'can only be deleted by the user who created it' do
    click_link 'Sign out'
    click_link 'Delete so so'
    expect(page).to have_content("You can't delete this review")
  end

  scenario 'displays an average rating for all reviews' do
    leave_review('So so', '4')
    visit '/restaurants'
    click_link 'Add a restaurant'
    fill_in 'Name', with: 'Burger King'
    click_button 'Create Restaurant'
    click_link 'Review Burger King'
    fill_in 'Thoughts', with: 'so so'
    select '4', from: 'Rating'
    click_button 'Leave Review'
    expect(page).to have_content('Average rating: ★★★★☆')
  end

end