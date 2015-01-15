require "norikra/listener"
require "fluent-logger"

module Norikra
  module Listener
    class Fluentd < Norikra::Listener::Base
      def self.check(group_name)
        group_name && group_name =~ /^FLUENTD\((.+)\)$/ && $1
      end

      def initialize(query_name, query_group, events_statistics)
        super
        @host, port = Fluentd.check(query_group).split(':', 2)
        raise Norikra::ArgumentError, "host is not specified" unless @host
        @port = port ? port.to_i : 24224
        ## TODO: initialize fluent-logger
      end

      def process_async(events)
        ### logger
      end
    end
  end
end
