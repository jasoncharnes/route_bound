# Implicit model binding for Rails.
# Include in any ApplicationController instance.
module RouteBound
  def self.included(base)
    base.before_action :route_bound_find_model
  end

  def route_bound_find_model
    instance_variable_set("@#{implied_model_name.downcase}", implied_model)
  rescue NameError
    Rails.logger.info("RouteBound unable to find the model #{implied_model_name}")
  end

  private

  def implied_model_name
    params[:controller].singularize.capitalize
  end

  def implied_model
    Object.const_get(implied_model_name).send(:find, params[:id])
  end
end
