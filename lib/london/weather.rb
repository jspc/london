require 'yahoo-weather'

module London
  class Weather
    def initialize
      @client = YahooWeather::Client.new
      @london = 44418
    end

    def timestamp datetime
      datetime.strftime('%H:%M:%S')
    end

    def query!
      resp = @client.lookup_by_woeid @london
      {
        temp: resp.condition.temp,
        sunrise: timestamp(resp.astronomy.sunrise),
        sunset: timestamp(resp.astronomy.sunset),
        high: resp.forecasts.first.high,
        low: resp.forecasts.first.low,
        wind: "#{resp.wind.speed}, #{resp.wind.direction}",
        chill: resp.wind.chill
      }
    end
  end
end
