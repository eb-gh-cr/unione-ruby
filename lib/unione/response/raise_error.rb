require 'faraday'
require 'unione/error'

module UniOne
  # UniOne response middleware
  module Response

    # This class raises an UniOne-flavored exception based
    # HTTP status codes returned by the API
    class RaiseError < Faraday::Response::Middleware

      private

      def on_complete(response)
        if error = UniOne::Error.from_response(response)
          raise error
        end
      end
    end
  end
end
