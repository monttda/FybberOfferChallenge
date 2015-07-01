require 'rails_helper'
describe Offer do
  describe ".fetch_offers" do
    context " when given a proper uid " do
      it "should return successful request from the Fyber API " do
        response = Offer.fetch_offers('1','','player1')
        expect(response.code).to eq("200")
        expect(response.body.class).to be(String)
      end
    end
    context " when given an uproper uid " do
      it "should return an unsuccessful request from the Fyber API " do
        response = Offer.fetch_offers('1','','')
        expect(response.code).to eq("400")
        expect(response.body.class).to be(String)
      end
    end

  end

  describe ".parse_to_json" do
    context " when given a successful API response " do
      it "should return successful request from the Fyber API " do
        response = Offer.fetch_offers('1','','player1')
        parsed_response = Offer.parse_to_json(response)
        expect(parsed_response.class).to eq(Hash)
      end
    end
    context " when given an unsuccessful API response " do
      it "should return an unsuccessful request from the Fyber API " do
        response = Offer.fetch_offers('1','','')
        parsed_response = Offer.parse_to_json(response)
        expect(parsed_response.class).to eq(Hash)
      end
    end

  end

end
