class BaseApi
  attr_reader :date

  def initialize(date, response_attribute)
    @date = build_date(date)
    @response_attribute = response_attribute
  end
end
