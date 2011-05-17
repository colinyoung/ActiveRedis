module ActiveRedis
  module ConnectionAdapters
    class Redis
      
      attr_accessor :options
      attr_reader :client
      
      def initialize(redis_instance=nil)
        redis_instance ||= ::Redis.new
        client = redis_instance
      end
      
      def client=(client)
        @client = client
      end
    end
  end
end