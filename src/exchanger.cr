require "json"
require "http/client"
require "./currency"


module Exchanger
    class Fixer
        @endpoint = "http://data.fixer.io/api/latest"

        def initialize(amount : Int32, origin : String, targets : Array(String))
            @amount = amount
            @origin = origin
            @targets = targets
        end

        def set_token(token : String)
            @token = token
        end

        def to_large_int(value)
            begin
                return value.as_f * 1000000.0

            rescue TypeCastError
                return (value.as_i * 1000000).to_f
            end
        end

        def compute(base, target)
            rate = target / base
            value = (@amount * rate) / 100

            (value * 100).round / 100.0
        end

        def convert
            params = HTTP::Params.encode({
                "access_key" => (@token || "")
            })

            body = ""
            begin
                body = ( HTTP::Client.get "#{@endpoint}?#{params}" ).body

            rescue Socket::Addrinfo::Error
                raise Exchanger::Exception.new "cannot connect to the API endpoint"
            end

            response = JSON.parse(body)
            if response["success"] == false
                code = response["error"]["code"]

                if code == 101
                    raise Exchanger::Exception.new "missing or invalid key"
                end
            end

            rates = response["rates"]
            base = to_large_int(rates[@origin])

            results = Array(Float64).new
            @targets.each do |symbol|
                target = to_large_int(rates[symbol])
                results << compute(base, target)
            end

            results
        end
    end

    class Exception < Exception
    end
end
