class HomeController < ApplicationController
  def index
  end

  def menu
    @sections = Section.all
    if params[:section_id].present?
      @current_section = Section.find(params[:section_id])
      @food_items = @current_section.food_items
    else
      @food_items = FoodItem.all
    end


    if params[:sort_by]
      case params[:sort_by]
        when "name_a_to_z"
          @food_items = @food_items.order(:name)
        when "name_z_to_a"
          @food_items = @food_items.order(:name => :desc)
        when "price_high_to_low"
          @food_items = @food_items.order(:price => :desc)
        when "price_low_to_high"
          @food_items = @food_items.order(:price)
        else
          @food_items = @food_items.order(:id)
      end
    end

    if params[:sort_column]
      @food_items = @food_items.order("#{params[:sort_column]} #{params[:sort_direction]}")
    end
  end

  def contact_us
  end
end
