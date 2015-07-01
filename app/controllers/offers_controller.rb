class OffersController < ApplicationController

  # Dummy action for rendering the root view
  def index

  end

  # GET
  # Fetches the offers avilables for the corresponding search
  #
  # @return [Hash] @json_response: JSON containign the Fyber API response.
  def fetch_offers
    pub0 = params[:pub0]
    uid = params[:uid]
    page = params[:page]
    http_response = Offer.fetch_offers(page,pub0,uid)
    @json_response = Offer.parse_to_json(http_response)
  end
end
