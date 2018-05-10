class HomeController < ApplicationController
  def index
  end

  def about
    @hello = 'some random text '
  end
end
