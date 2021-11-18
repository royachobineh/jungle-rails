require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  before :each do
    @user = User.create!(
      name: 'Armeen Hadizadeh',
      email: 'armeen123@gmail.com',
      password: 'password1234',
      password_confirmation: 'password1234'
    )
  end

  scenario "User can login with valid credentials" do 

    visit login_path

    fill_in 'email', with: 'armeen123@gmail.com'
    fill_in 'password', with: 'password1234'

    click_on 'Submit'

    expect(page).to have_content('Armeen Hadizadeh')
  end
end
