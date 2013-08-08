module WDuck
  require 'httpclient'
  require 'json'
  require 'htmlentities'
  require 'rainbow'

  module DuckHelper

    API_URL = "https://api.duckduckgo.com/"
    FORMAT = "json"

    def get_json_data(query)
      http = HTTPClient.new(agent_name: "ddg.rb")
      args = { q: query, format: FORMAT }
      data = http.get_content(API_URL, args )
      JSON.parse data
    end

    def make_sane(value)
      # remove html tags, convert to proper utf codes

      coder = HTMLEntities.new
      re = /<("[^"]*"|'[^']*'|[^'">])*>/
      coder.decode(value.gsub(re, '')) #remove html tags, then make proper unicode conversion
    end

    def heading(parsed_data)
      unless parsed_data["Heading"].empty?
        puts make_sane(parsed_data["Heading"]).foreground(:red).background(:white)
      end
    end

    def source(parsed_data)
      unless parsed_data["AbstractSource"].empty?
        puts "Source: #{make_sane(parsed_data["AbstractSource"])}".color(:yellow)
      end
    end

    def abstract_text(parsed_data)
      puts make_sane(parsed_data["AbstractText"]).color(:green)
    end

    def result_text(index, result)
      puts "#{(index + 1)},  #{make_sane(result["Text"]).color(:green)}" if result["Text"]
    end

    def answer(parsed_data)
      puts make_sane(parsed_data["Answer"]).color(:green)
    end
  end
end
