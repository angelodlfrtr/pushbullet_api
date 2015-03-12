module PushbulletApi
  module Objects
    class Devices < PushbulletApi::HTTPRequest

      class << self

        def all
          PushbulletApi::Objects::Response.new(new())
        end

        def create args = {}
        end

        def update iden, args = {}
        end

        def delete iden
        end
      end

      def initialize args = {}
        self.action = args[:action].to_s || 'devices'
        self.verb   = args[:verb] || :get
      end
    end
  end
end
