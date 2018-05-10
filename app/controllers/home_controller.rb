require 'net/http'
require 'json'

class HomeController < ApplicationController

  before_action :load_api, only: [:index, :lookup]

  def index
    @my_coins = ["BTC", "XRP", "ADA", "XLM", "STEEM"]
  end

  def about
    @hello = 'some random text '
  end

  def lookup

    @symbol = params[:sym]
    if @symbol
      @symbol = @symbol.upcase
    end

    if @symbol == ""
      @symbol = "Hey, you forgot to enter a currency!"
    end
  end

  private

  def load_api
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
  end

end
