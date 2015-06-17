When(/^I go to the new user registration page$/) do
  visit "/users/sign_up"
end

When(/^I fill in the new user form with email "(.*?)", password "(.*?)" and password confirmation "(.*?)"$/) do |arg1, arg2, arg3|
  within("form") do
      fill_in 'Email', :with => arg1
      fill_in 'Password', :with => arg2
      fill_in 'Password confirmation', :with => arg3
  end
end

When(/^I submit the form$/) do
  click_button 'Sign up'
end

Then(/^I should be on the dashboard page$/) do
  expect(page).to have_selector('h1',"Dashboard")
end

Then(/^I should be on login page$/) do
  expect(page).to have_selector('h2',"Log in")
end

Then(/^I should see the 'dashboard' contents$/) do
  expect(page).to have_selector('h1',"Dashboard")
end

Given(/^a user with email "(.*?)" and password "(.*?)"$/) do |arg1, arg2|
  User.create(email: arg1, password: arg2, password_confirmation: arg2)
end

When(/^I sign in manually as "(.*?)" with password "(.*?)"$/) do |arg1, arg2|
  visit "/users/sign_in"
  within("form") do
      fill_in 'Email', :with => arg1
      fill_in 'Password', :with => arg2
  end
  click_button 'Log in'
end

When(/^I go to login page$/) do
  visit "/users/sign_in"
end

When(/^I fill in login page with email "(.*?)" and password "(.*?)"$/) do |arg1, arg2|
  visit "/users/sign_in"
  within("form") do
      fill_in 'Email', :with => arg1
      fill_in 'Password', :with => arg2
  end
  click_button 'Log in'
end
