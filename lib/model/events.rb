module ActiveRedis
  module Model
    
    '''
    Events
    '''
    def save
      self.class.attrs.each do |key,value|
        puts "#{key} : #{value}"
      end
    end
    
    def destroy
    end
    
    def destroy_all
    end
    
    def update
    end
    
    def validate
    end
    
    module ClassMethods # Events
      @@moments = %w(before after)
      @@phase_blocks = {}
      
      '''
      Callbacks
      '''
      
      # Phases
      %w(create destroy save update validation).each {|phase|
        
        # Define methods
        @@moments.each do |moment|
          class_eval <<-EOS
            def #{moment}_#{phase}(*args)
              
              # Define block storage var
              @@phase_blocks[:#{phase}] = args.first
                            
              puts "[ActiveRedis] #{moment}_#{phase} happened...block was added to storage."
            end
          EOS
        end
      }
      
    end
  end
end