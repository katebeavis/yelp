require 'rails_helper'

context 'user not signed in and on the homepage' do
  it 'sees a sign in and a sign up link' do
    visit('/')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end

  it 'does not see sign out link' do
    visit('/')
    expect(page).not_to have_link('Sign out')
  end
end

context 'user signed in on the homepage' do
  before do
    Restaurant.create(name: 'KFC')
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  it 'sees sign out link' do
    visit('/')
    expect(page).to have_link('Sign out')
  end

  it 'does not see a sign in link and a sign up link' do
    visit('/')
    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end

  it 'can only edit restaurants which they\'ve created' do
    visit('/')
    click_link 'Edit KFC'
    expect(page).to have_content 'You can\'t edit this restaurant'
  end

  it 'can only delete restaurants which they\'ve created' do
    visit('/')
    click_link 'Delete KFC'
    expect(page).to have_content 'You can\'t delete this restaurant'
  end
end
