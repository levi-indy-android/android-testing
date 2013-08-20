$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'rspec-expectations'
require 'gametel'
require 'require_all'

require_all 'lib'

World(Gametel::Navigation)

Gametel.apk_path = 'github-android-1.7.apk'

Before do
  @driver = Gametel.start('ui.user.HomeActivity')
end

After do
  Gametel.stop
end


