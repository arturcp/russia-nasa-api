class NasaApi < BaseApi
  BASE_URL = 'https://api.nasa.gov/planetary/apod'

  private

  def uri
    "?api_key=#{ENV['NASA_ACCESS_TOKEN']}&date=#{formatted_date}"
  end
end
