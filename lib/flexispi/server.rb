# frozen_string_literal: true

module Flexipi
  class Server
    attr_reader :server

    def initialize(port)
      @server = TCPServer.new(port)
    end

    def start
      puts "Server listening on port #{@server.addr[1]}..."

      loop do
        client = @server.accept
        message = client.gets.chomp
        puts "Received message: #{message}"

        case message
        when 'up'
          client.puts 'Hi there!'
        when 'down'
          client.puts 'See you later!'
        else
          client.puts 'Unknown command'
        end

        client.close
      end
    end
  end
end
