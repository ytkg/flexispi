# frozen_string_literal: true

module Flexipi
  class Client
    attr_reader :client

    def initialize(host, port)
      @client = TCPSocket.new(host, port)
    end

    def send_message(message)
      @client.puts message
      response = @client.gets.chomp
      puts "Response: #{response}"
    end

    def close
      @client.close
    end
  end
end
