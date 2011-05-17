module ActiveRedis
  module Model
    module ClassMethods # Configuration
      
      def field(*args)
      
        # Define storage variables
        field_name = args.first.to_s
        var_name = field_name.underscore.downcase
        var_symbol = ":#{var_name}"
        attrs[var_symbol] = nil
        puts attrs.to_json
        puts "=> Defined storage var '#{var_name}'"
        
        # Define getters and setters
        class_eval <<-EOS
        
          def #{var_name}
            return self.class.attrs[#{var_symbol}] if self.class.attrs[#{var_symbol}].present?
            nil
          end
          
          def #{var_name}=(*args)
            self.class.attrs[#{var_symbol}] = args.first
          end
          
        EOS
        
      end
      
    end
  end
end