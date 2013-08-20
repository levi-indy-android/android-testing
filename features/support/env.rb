$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'rspec-expectations'

require 'gametel'


require 'require_all'

require_all 'lib'

World(Gametel::Navigation)

keystore = {
  :path => File.expand_path('~/.android/debug.keystore'),
  :alias => 'androiddebugkey',
  :password => 'android',
  :keystore_password => 'android'
}

Gametel.apk_path = PATH_TO_APK
Gametel.keystore = keystore

Before do
  @driver = Gametel.start(ACTIVITY_NAME_GOES_HERE)
end

After do
  Gametel.stop
end


