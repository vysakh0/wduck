module Wduck

  module Duck
    require 'wduck/duck_helper'

    class Ddg
      def initialize(query)
        @query = query
      end

      def result
        search_result = DuckHelper::SearchResult.new(@query)

        puts_color search_result.heading  , :red
        puts_color search_result.source   , :green
        puts_color search_result.answer   , :yellow
        puts_color search_result.abstract , :green

        if search_result.related_topics
          puts "\nRelated Topics".color(:white).underline

          search_result.related_topics.each do |result|
            puts_color result["Text"], :green
          end
        end
      end

      private

      def puts_color(type, color)
        puts make_sane(type).color(color) if type
      end

      def make_sane(value)
        re = /<("[^"]*"|'[^']*'|[^'">])*>/
        HTMLEntities.new.decode(value.gsub(re, '')) #remove html tags, then make proper unicode conversion
      end

    end

  end
end
