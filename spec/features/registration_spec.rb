feature 'Registration' do
  scenario 'Visitor registers successfully via register form' do
    visit new_user_registration_path
    within '#new_user' do
      fill_in 'Email', with: FFaker::Internet.safe_email
      fill_in 'Password', with: 'test123456A'
      fill_in 'Password confirmation', with: 'test123456A'
      click_button('Sign up')
    end
    expect(page.current_path).to eq root_path
    expect(page).not_to have_content 'Sign up'
    expect(page).to have_content 'Log out'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
