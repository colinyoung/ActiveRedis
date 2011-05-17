require 'active_support/concern'
require 'active_support/inflector'
module ActiveRedis

  class << self
    # def configure(&block)
    #   ActiveRedis::Action::Base.configure(&block)
    # end
  end

  module Action
    autoload :Base, 'active_redis/model'
    autoload :Finders, 'active_redis/model/finders'
    autoload :Configuration, 'active_redis/model/configuration'
  end
end

if defined?(Rails)

  module ActiveRedis
    class Railtie < Rails::Railtie
      initializer "active_redis.actions" do
        Dir.glob(Rails.root+"app/models/*").each {|file| require file}
      end
    end
  end
end