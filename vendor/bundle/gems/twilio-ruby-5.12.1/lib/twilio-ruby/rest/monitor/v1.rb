##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Monitor
      class V1 < Version
        ##
        # Initialize the V1 version of Monitor
        def initialize(domain)
          super
          @version = 'v1'
          @alerts = nil
          @events = nil
        end

        ##
        # @param [String] sid The sid
        # @return [Twilio::REST::Monitor::V1::AlertContext] if sid was passed.
        # @return [Twilio::REST::Monitor::V1::AlertList]
        def alerts(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @alerts ||= AlertList.new self
          else
            AlertContext.new(self, sid)
          end
        end

        ##
        # @param [String] sid A 34 character string that uniquely identifies this event.
        # @return [Twilio::REST::Monitor::V1::EventContext] if sid was passed.
        # @return [Twilio::REST::Monitor::V1::EventList]
        def events(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @events ||= EventList.new self
          else
            EventContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Monitor::V1>'
        end
      end
    end
  end
end