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
    verify_response(http_response.code)
  end

  private

    # Depending on the Fyber API responde code assign an error to the flash
    # if there is one
    def verify_response(code)
      case code
      when "200"
        flash.now[:success] = t('request.empty')
        if @json_response['count'].present?
          @empty = @json_response['count'] > 0 ? false : true
        else
          @empty = true
        end
      when "400"
        flash.now[:error] = t('request.params_error')
        @empty = true
      when "401","404"
        flash.now[:error] = t('request.app_error')
        @empty = true
      when "500", "502"
        flash.now[:error] = t('request.fyber_error')
        @empty = true
      else
        @empty = true
      end
    end
end
