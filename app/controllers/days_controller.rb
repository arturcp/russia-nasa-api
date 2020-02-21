class DaysController < ApplicationController
  def index
    render json: { image: NasaApi.new.image_of_the_day, is_it_a_holiday_on_russia: false }
  end
end
