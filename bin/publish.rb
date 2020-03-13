require 'bunny'
require 'json'

conn = Bunny.new
conn.start

(1..30).each do |i|
  payload = {
    date: "2020-01-#{i.to_s.rjust(2,'0')}"
  }

  ch = conn.create_channel
  ch.default_exchange.publish(payload.to_json, routing_key: 'show_if_it_is_russian_holiday')
  sleep(0.2)
end

conn.close
