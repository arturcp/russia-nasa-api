class RussiaApi < BaseApi
  BASE_URL = 'https://datazen.katren.ru/calendar/day'

  private

  def uri
    "/#{formatted_date}/"
  end
end
