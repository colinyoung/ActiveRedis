module ActiveRedis
  module Model
    module ClassMethods # Finders

      def find(*args)
        @find_options = [:conditions, :order, :group, :limit, :offset, :include, :from, :readonly, :lock]
        all_or_id = args.shift
        
        # All
        if all_or_id == :all
        
        # Find options  
        elsif @find_options.include?(all_or_id)
        
        # Value (looking for an id value)
        else
          
        end
      end
      
      def all(*args)
        find(:all, args)
      end
      
    end
  end
end