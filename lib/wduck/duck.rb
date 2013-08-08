module WDuck
  require_relative 'duck_helper'
  class Duck

    include WDuck::DuckHelper

    def initialize(query)
      @parsed_data = get_json_data(query)
    end

    def result
      heading(@parsed_data)
      source(@parsed_data)

      if @parsed_data["Answer"].empty?
        abstract_text(@parsed_data)

        if @parsed_data["AbstractText"].empty?
          @parsed_data["RelatedTopics"].each_with_index do |result, index|
            result_text(index, result)
          end
        end

      else
        answer(@parsed_data)
      end

    end

  end
end
