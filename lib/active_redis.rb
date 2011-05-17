#require 'active_support/concern'
#require 'active_support/inflector'
module ActiveRedis

  class << self
    # def configure(&block)
    #   ActiveRedis::Action::Base.configure(&block)
    # end
  end

  autoload :Model, 'model/model'
  autoload :Timestamps, 'extensions/timestamps'  
end

if defined?(Rails)

  module ActiveRedis
    class Railtie < Rails::Railtie
      initializer "active_redis.actions" do
        puts "=> ActiveRedis initialized."
        # Dir.glob(Rails.root+"app/redis_models/*").each {|file| require file}
      end
    end
  end
end