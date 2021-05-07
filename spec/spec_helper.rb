if ENV['COVERAGE'] == '1'
  require 'simplecov'
  SimpleCov.start
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'commonmarker/rouge'
