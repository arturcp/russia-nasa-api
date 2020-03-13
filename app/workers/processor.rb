require 'sneakers'
require 'json'
require 'rails'
require 'rest-client'
require 'colorize'
require_relative '../models/base_api'
require_relative '../models/russia_api'

class Processor
  include Sneakers::Worker
  from_queue :show_if_it_is_russian_holiday

  # {
  #   "date": "2019-02-01"
  # }
  def work(msg)
    payload = JSON.parse(msg)
    date = payload['date']

    puts "Is it holiday on Russia at #{date.to_s.yellow}? #{RussiaApi.new(date, 'holiday').get.to_s.green}"

    ack!
  end
end
