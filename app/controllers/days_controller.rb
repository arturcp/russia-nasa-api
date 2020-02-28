class DaysController < ApplicationController
  def index
    date = params[:date]

    render json: {
      image: NasaApi.new(date, 'url').get,
      is_it_a_holiday_on_russia: RussiaApi.new(date, 'holiday').get
    }
  end
end
