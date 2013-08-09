module Wduck

  module Duck
    require 'wduck/duck_helper'

    class Ddg
      include Wduck::DuckHelper

      def initialize(query)
        @search_data = DuckHelper::SearchData.new(query)
      end

      def result
        @search_data.heading # eg: Linus Torvalds
        @search_data.source # eg: Wikipedia

        @search_data.answer # Helsiniki Kernel Hacker
        # when results has too options like Ruby: a lang, a gem etc
        @search_data.abstract
        @search_data.topics_result #the all related results/topics
      end

    end

  end

end
