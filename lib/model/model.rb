require 'net/http'
require 'net/https'
require 'uri'

require 'module_inheritable_attributes'

module ActiveRedis
  module Model
    
    # Required classes
    %w(
      associations
      accessors
      finders
      configuration
      callbacks
      validations
    ).each {|submodule| require "model/#{submodule}" }
    
    def self.included(base)
      base.extend ClassMethods
      base.send :include, ::ModuleInheritableAttributes
      base.send(:mattr_inheritable, :attrs)
      base.instance_variable_set("@attrs", ActiveSupport::HashWithIndifferentAccess.new)
      puts "Public Instance Methods"
      public_instance_methods = ClassMethods.public_instance_methods(false)
      puts public_instance_methods.to_yaml
      puts "Public Class Methods"
      puts ClassMethods.methods(false).delete_if {|method_name| public_instance_methods.include?(method_name)}.to_yaml
    end
    
    # Optional classes
    # autoload :Calculations, 'model/calculations'
    

    '''
    Instance methods
    '''
    
    def attributes
      self.class.attrs
    end
    
    '''
    Misc. methods
    '''
    def to_s
      self.class.attrs
    end
  
  end
end