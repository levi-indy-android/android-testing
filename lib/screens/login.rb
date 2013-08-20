class Login
  include Gametel

  text(:username, :index => 0)
  text(:password, :index => 1)

  view(:login, :text => 'Log in')
end
