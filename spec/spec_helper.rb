$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'quicken'
require 'spec'
require 'spec/autorun'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

Spec::Runner.configure do |config|
  config.include  MoneyMatcher
  config.extend   FoundationMacro
end