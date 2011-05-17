module ActiveRedis
  module Model
    
    # Setters
    def []=(key, value)
      key = key.to_s.downcase
      self.class.attrs[key] = value
    end
    
    module ClassMethods # Accessors
      
      def first
        self.class.all(:limit => 1, :order => "id ASC")
      end
      
      def last
        self.class.all(:limit => 1, :order => "id DESC")
      end
      
    end
  end
end