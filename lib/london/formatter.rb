module London
  class Formatter
    def initialize
      @weather = London::Weather.new
    end

    def get_output
      weather = @weather.query!
      temperature = to_celsius(weather[:temp])
      chill = to_celsius(weather[:temp])
      high = to_celsius(weather[:temp])
      low = to_celsius(weather[:temp])

      [ "Weather: #{temperature}, (Wind: #{weather[:wind]}, chill of #{chill})",
        "Sunrise: #{weather[:sunrise]}",
        "Sunset: #{weather[:sunset]}",
        "High: #{high}, Low: #{low}"
      ].join("\n")
    end

    def to_celsius temperature
      ["#{(temperature - 32) * 5/9}", "\u00B0".encode, "c"].join
    end
  end
end
