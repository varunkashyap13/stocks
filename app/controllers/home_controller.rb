class HomeController < ApplicationController
  def index
    @api = StockQuote::Stock.new(api_key: 'pk_b658787a96e74a29b40a1aa367a0d956')

    if params[:ticker] == ""
      @nothing = "Stock ticker symbol not entered."
    elsif params[:ticker]

      begin
        @stock = StockQuote::Stock.quote(params[:ticker])
      rescue RuntimeError
        @error = "Stock symbol doesn't exist. Please try again."
      else 
        p "No error"
      ensure  
        p "Done"
      end
    end
  end

  def about
  end
end
