class PagesController < ApplicationController
  
  def index
    @cart = current_cart
  end

  def tips
    @cart = current_cart
  end

  def contact
    @cart = current_cart
  end

  def about
      @cart = current_cart
  end

  def articles
    @cart = current_cart
  end

  def videos
    @cart = current_cart
  end
end
