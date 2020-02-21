class NasaApi
  URL = 'https://api.nasa.gov/planetary/apod'

  # def self.image_of_the_day(date = Date.today)
  #   access_key = 'LQYoLPL84kSn4bCGpd55JXMOtoJcpKxC3zXdV1Vr'
  #   formatted_date = date.strftime('%Y-%m-%d')
  #   url = "https://api.nasa.gov/planetary/apod?api_key=#{access_key}&date=#{formatted_date}"
  #
  #   response = RestClient.get(url, headers={})
  #   response = JSON.parse(response)
  #
  #   response['url']
  # end

  attr_reader :date

  def initialize(date = Date.today)
    @date = date
    @access_key = ENV.fetch('NASA_ACCESS_TOKEN')
  end

  def image_of_the_day
    response = client.get(url, headers)
    JSON.parse(response)['url']
  end

  private

  attr_reader :access_key

  def formatted_date
    date.strftime('%Y-%m-%d')
  end

  def url
    "#{URL}?api_key=#{access_key}&date=#{formatted_date}"
  end

  def headers
    {}
  end

  def client
    RestClient
  end
end
