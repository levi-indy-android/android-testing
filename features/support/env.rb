$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'rspec-expectations'
require 'gametel'
require 'require_all'
require 'ADB'

require_all 'lib'

World(Gametel::Navigation, ADB)

Gametel.apk_path = 'github-android-1.7.apk'

Before('@login') do 
  begin
    uninstall 'com.github.mobile'
  rescue
  end
  install 'github-android-1.7.apk'
end

Before do
  @driver = Gametel.start('ui.user.HomeActivity')
end

After do
  Gametel.stop
end


