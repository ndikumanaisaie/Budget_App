require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  background { visit new_user_registration_path }
  scenario 'Page should have a registration form' do
    expect(page.has_field?('Name')).to be true
    expect(page.has_field?('Email')).to be true
    expect(page.has_field?('Password')).to be true
    expect(page.has_field?('Password confirmation')).to be true
    expect(page.has_button?('Sign up')).to be true
  end

  context 'Form Submission' do
    scenario 'Submit form without email' do
      click_button 'Sign up'
      expect(page).to have_content "Email can't be blank"
    end

    scenario 'Submit form with no name' do
      within 'form' do
        fill_in 'Email', with: 'jb@gmail.com'
        fill_in 'Password', with: '2ddd22'
        fill_in 'Password confirmation', with: '2ddd22'
      end
      click_button 'Sign up'
      expect(page).to have_content "Name can't be blank"
    end

    scenario 'Submit form with no password' do
      within 'form' do
        fill_in 'Email', with: 'jb@gmail.com.com'
      end
      click_button 'Sign up'
      expect(page).to have_content "Password can't be blank"
    end
  end
end