require 'net/http'
require 'net/https'
require 'uri'

require 'module_inheritable_attributes'
require 'connection_adapters/redis'

module ActiveRedis
  module Model
    
    # Required classes
    %w(
      associations
      accessors
      finders
      configuration
      events
      validations
    ).each {|submodule| require "model/#{submodule}" }
    
    def self.included(base)
      base.extend ClassMethods
      base.send :include, ::ModuleInheritableAttributes
      base.send(:mattr_inheritable, :attrs)
      base.send(:mattr_inheritable, :client)
      base.instance_variable_set("@attrs", ActiveSupport::HashWithIndifferentAccess.new)
      base.instance_variable_set("@client", ActiveRedis::ConnectionAdapters::Redis.new)
    end
    
    # Optional classes
    # autoload :Calculations, 'model/calculations'
    

    '''
    Instance methods
    '''
    def attributes
      pp self.class.attrs
    end
    
    '''
    Misc. methods
    '''
    def to_s
      self.class.attrs
    end
  
  end
end