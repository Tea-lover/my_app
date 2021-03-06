class WorkController < ApplicationController
  include WorkImage
  include WorkHelper
  skip_before_action :verify_authenticity_token

  def index
    @images_count = Image.all.count
    #@selected_theme = "Select theme to leave your answer"
    @selected_theme = t('.def_select_theme')
    @selected_image_name = 'default'
    @values_qty = Value.all.count
    @current_locale = I18n.locale
    @themes = Theme.all.pluck(:name)
    session[:selected_theme_id] = @selected_theme # to display nothing
  end

  def choose_theme
    @themes = Theme.all.pluck(:name)
    logger.info "In WorkController#choose_theme @themes = #{@themes}"
    respond_to :js
  end


  # @note: first display_theme and show first image from image array
  def display_theme
    logger.info "In work#display_theme"
    @image_data = {}
    I18n.locale = session[:current_locale]

    current_user_id = current_user.id


    if params[:theme].blank?
      theme = "Select theme to leave your answer"
      theme_id = 1
      values_qty = Value.all.count.round
    data = { index: 0, name: 'default', values_qty: values_qty,
             file: 'end1.jpg', image_id: 4,
             current_user_id: current_user_id,
             user_valued: false,
             common_avg_value: 0, value: 0 }
    else
      theme = params[:theme]
      theme_id = Theme.find_theme_id(theme)
      data = show_image(theme_id, 0)
    end
    session[:selected_theme_id] = theme_id
    image_data(theme, data)
  end

  def results_list
    @selected_theme_id = session[:selected_theme_id]
    res_composite_diag = Image.where(theme_id: @selected_theme_id).order("ave_value DESC")
    composite_results_size = res_composite_diag.size
    @composite_results = res_composite_diag.take(composite_results_size)
    @composite_results_paged = pages_of(@composite_results, 6)
  end
end