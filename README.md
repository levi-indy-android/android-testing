## Indianapolis Android Meetup - Acceptance Testing

Source repository for the [Indianapolis Android Developers](http://www.meetup.com/Indy-Android-Developers/) group on 8/20/2013.

### Useful Links
* http://levi-indy-android.github.io/android-testing for tonight's slide deck
* [testgen](https://github.com/cheezy/testgen)
  * creates the cucumber shell with the command `testgen project your-project-name --with-gametel --with-lib`
* [brazenhead](https://github.com/leandog/brazenhead)
  * the low-level driver that drives Android applications from Ruby
* [gametel](https://github.com/leandog/gametel)
  * the page-object wrapper around brazenhead that provides a nice DSL for your application in your step definitions
* [robotium](https://github.com/jayway/robotium)
  *  Java library to assist brazenhead with interacting with Android applications

### Result Branch
The code sample that we ended up with during the talk is located in the [live example branch](https://github.com/levi-indy-android/android-testing/tree/live-example) which has the following scenarios completed:

```ruby
@login
Feature:  Logging into the GitHub application

  Scenario: Logging in successfully
    When we give valid credentials
    Then we end up on the home screen

  Scenario: Failing hard to login
    When we fail hard to login
    Then we are yelled at by GitHub
```

### Brazenhead Example
After we built a couple of scenarios, we ran through a quick example in an interactive ruby console to get information out of a live-running app:

```ruby
require 'brazenhead'

# start the app
server = Brazenhead::Server.new 'github-android-1.7.apk'
server.start 'ui.user.HomeActivity'

# create the driver
class Driver
  include Brazenhead
end
driver = Driver.new

# show how to call robotium from it
driver.enter_text 0, 'your-user-name'

# show how to get all the views
driver.get_current_views
driver.last_json # => all of the JSON serialized view information
driver.last_json.map {|v| v['classType']} # => all of the view class names

# show how to chain methods to get specific TextView class
driver.chain_calls do |device|
  device.get_class # get the Class<T> object
  device.for_name 'android.widget.TextView', :variable => '@@the_class@@' # get the Class<TextView> class and store it in @@the_class@@
  device.get_current_view '@@the_class@@', :target => :Robotium # send it back to robotium's getCurrentViews(Class<View>)
end
driver.last_json.map {|v| v['classType']} # all should be a descendant of TextView
```
