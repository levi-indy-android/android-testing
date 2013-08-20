When(/^we give valid credentials$/) do
  on(Login) do |screen|
    screen.username = 'levi-indy-android'
    screen.password = 'IndyAndroid0820'
    screen.login
  end
end

Then(/^we end up on the home screen$/) do
  on(HomeScreen).should be_active
end

When(/^we fail hard to login$/) do
  on(Login) do |screen|
    screen.username = 'levi-indy-android'
    screen.password = 'badpassword'
    screen.login
  end
end

Then(/^we are yelled at by GitHub$/) do
  on(Login).should have_text 'Please enter a valid'
end

