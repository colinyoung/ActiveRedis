module ActiveRedis
  module Model
    module ClassMethods # Configuration
      
      def field(*args)
      
        # Define storage variables
        field_name = args.first.to_s
        var_name = field_name.underscore.downcase
        attrs[var_name] = nil
        
        # Define getters and setters
        class_eval <<-EOS
        
          def #{var_name}
            return self.class.attrs["#{var_name}"] if self.class.attrs["#{var_name}"].present?
            nil
          end
          
          def #{var_name}=(*args)
            self.class.attrs["#{var_name}"] = args.first
          end
          
        EOS
        
      end
      
    end
  end
end