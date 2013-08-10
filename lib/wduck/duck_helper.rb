module Wduck
  require 'httpclient'
  require 'json'
  require 'htmlentities'
  require 'rainbow'

  module DuckHelper

    API_URL = "https://api.duckduckgo.com/"
    FORMAT  = "json"

    class SearchResult
      attr_reader :heading, :source, :answer, :abstract, :related_topics

      def initialize(query)
        @parsed_data    = get_json_data query
        @heading        = check_data "Heading"
        @source         = check_data "AbstractSource"
        @answer         = check_data "Answer"
        @abstract       = check_data "AbstractText"
        @related_topics = check_data "RelatedTopics"
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
    end

  end
end
