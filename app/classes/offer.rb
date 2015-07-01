require "net/http"
class Offer

  BASE_API_URL = "http://api.sponsorpay.com/feed/v1/offers.json?"

  # Fetches the offers from the Fyber API if there are any availables
  #
  # @param [String] page: The page of the response set that you are requesting.
  # @param [String] pub0: Custom parameters for the request.
  # @param [String] uid: This parameter represents the unique User ID
  #
  # @return [Net::HTTPResponse] the Response from the Fyber API
  def self.fetch_offers(page,pub0,uid)
    time_stamp = Date.today.to_time.to_i
    device_id = ENV['FYBER_DEVICE_KEY']
    ip = ENV['FYBER_REQUEST_IP']
    locale = ENV['FYBER_LOCALE']
    appid = ENV['FYBER_APP_ID']
    offer_types = ENV['FYBER_OFFER_TYPE']
    request_params = "appid=#{appid}"              \
                     "&device_id=#{device_id}"     \
                     "&ip=#{ip}"                   \
                     "&locale=#{locale}"           \
                     "&offer_types=#{offer_types}" \
                     "&page=#{page}"               \
                     "&pub0=#{pub0}"               \
                     "&timestamp=#{time_stamp}"    \
                     "&uid=#{uid}"
    hash_key = Offer.generate_request_hash_key(request_params)
    url = "#{BASE_API_URL}#{request_params}&hashkey=#{hash_key}"
    response = Net::HTTP.get_response(URI.parse(url))
  end

  # Transforms the Net::HTTP response body from JSON to a Hash
  # @param [Net::HTTPResponse] response: the Response from the Fyber API
  def self.parse_to_json(response)
    json_response = JSON.parse(response.body)
  end
  
  private
    # Returns the Hash representation of the params
    # @param [String] base_string: string that will be the base to calculate the
    #                 Hash SHA1 of it.
    def self.generate_request_hash_key(base_string)
      base_string = "#{base_string}&#{ENV['FYBER_API_KEY']}"
      hash_key = Digest::SHA1.hexdigest(base_string)
    end
end
