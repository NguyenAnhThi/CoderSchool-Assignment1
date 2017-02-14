class HomeController < ApplicationController
  def index
  end

  def menu
  	@sections = Section.all
  end

  def contact_us
  end
end
