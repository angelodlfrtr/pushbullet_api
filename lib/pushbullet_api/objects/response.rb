module PushbulletApi
  module Objects
    class Response < PushbulletApi::Response

      def intialize(req)
        super(req)
      end

      def method_missing(m, *args, &block)
        if @body.has_key?(m.to_s)
          @body[m.to_s]
        else
          super
        end
      end
    end
  end
end
