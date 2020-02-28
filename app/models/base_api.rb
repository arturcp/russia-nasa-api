class BaseApi
  attr_reader :date

  def initialize(date, response_attribute)
    @date = build_date(date)
    @response_attribute = response_attribute
  end

  def get
    response = client.get(url, headers)
    JSON.parse(response)[response_attribute]
  end

  private

  attr_reader :response_attribute

  def build_date(date)
    date ? Date.parse(date) : Date.current
  end

  def formatted_date
    date.strftime('%Y-%m-%d')
  end

  def url
    "#{self.class::BASE_URL}#{uri}"
  end

  def headers
    {}
  end

  def client
    RestClient
  end
end
