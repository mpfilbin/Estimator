require 'sinatra/base'
require 'sinatra/config_file'

module Estimator
  class Application < Sinatra::Base
    set :root, File.dirname(__FILE__)
    config_file get(:root) + '/etc/config.yml'


  end
end
