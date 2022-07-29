require 'date'
require 'json'

class TimeError
  def initialize(requestor)
    @requestor = requestor
  end
  # Returns difference in seconds between server time
  # and the time on this computer
  def error(current_time)
    return get_server_time - current_time
  end

  private

  def get_server_time
    text_response = @requestor.get("www.worldtimeapi.org", "/api/ip")
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end

require 'net/http'

time_error = TimeError.new(Net::HTTP)
p time_error.error(Time.now)
# p time_error