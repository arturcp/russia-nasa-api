# require 'bunny'
# require 'json'

class DaysController < ApplicationController
  def index
    date = params[:date]

    render json: {
      image: NasaApi.new(date, 'url').get,
      is_it_a_holiday_on_russia: RussiaApi.new(date, 'holiday').get
    }
  end

  def create
    conn = Bunny.new
    conn.start

    (1..1).each do |i|
      payload = {
        date: "2020-01-#{i.to_s.rjust(2,'0')}"
      }

      ch = conn.create_channel
      ch.default_exchange.publish(payload.to_json, routing_key: 'show_if_it_is_russian_holiday')
    end

    conn.close

  end
end
