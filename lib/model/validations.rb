module ActiveRedis
  module Model
    module ClassMethods # Validations
      
      def valid?
        false
      end
      
      def validate
      end
      
    end
  end
end