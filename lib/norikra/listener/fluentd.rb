require "norikra/listener"
require "fluent-logger"

module Norikra
  module Listener
    class Fluentd < Norikra::Listener::Base
      def self.label
        "FLUENTD"
      end

      def initialize(argument, query_name, query_group)
        super
        addr, tag_prefix = argument.split(',', 2)
        host, port_str = addr.split(':', 2)
        raise Norikra::ArgumentError, "host is not specified" unless host
        port = port_str ? port_str.to_i : 24224
        @tag = tag_prefix ? "#{tag_prefix}.#{query_name}" : query_name
        @log = Fluent::Logger::FluentLogger.new(nil, host: host, port: port)
      end

      def process_async(events)
        events.each do |time, record|
          @log.post_with_time(@tag, record, time)
        end
      end
    end
  end
end
