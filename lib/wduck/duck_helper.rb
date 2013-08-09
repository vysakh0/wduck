module Wduck
  require 'httpclient'
  require 'json'
  require 'htmlentities'
  require 'rainbow'

  module DuckHelper

    API_URL = "https://api.duckduckgo.com/"
    FORMAT  = "json"

    class SearchData

      attr_reader :answer_data
      def initialize(query)
        @parsed_data     = get_json_data(query)
        @answer_data = check_data("Answer")
        @abstract_text   = check_data("AbstractText")
        @related_topics  = check_data("RelatedTopics")
        @heading         = check_data("Heading")
        @abstract_source = check_data("AbstractSource")
      end

      def heading
        puts "Heading".color(:cyan).underline
        display(@heading, :red )
        puts ""
      end

      def source
        display(@abstract_source, :yellow)
        puts " "
      end

      def abstract
        display(@abstract_text, :green)
      end

      def topics_result
        if @related_topics
          puts ""
          puts "Related Topics".color(:white).underline
          puts ""
          @related_topics.each do |result|
            puts "#{display(result["Text"], :green)}" if result["Text"]
          end
        end
      end

      def answer
        display(@answer_text, :yellow)
      end

      private

      def get_json_data(query)
        http = HTTPClient.new(agent_name: "ddg.rb")
        args = { q: query, format: FORMAT }
        data = http.get_content(API_URL, args )
        JSON.parse data
      end

      def check_data(data)
        @parsed_data[data].empty? ? nil : @parsed_data[data]
      end

      def display(type, color)
        puts make_sane(type).color(color) if type
      end

      def make_sane(value)
        # remove html tags, convert to proper utf codes
        coder = HTMLEntities.new
        re = /<("[^"]*"|'[^']*'|[^'">])*>/
        coder.decode(value.gsub(re, '')) #remove html tags, then make proper unicode conversion
      end

    end
  end

end
