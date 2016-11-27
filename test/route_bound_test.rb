require 'test_helper'
require 'mocha/mini_test'

module BadModelParams
  def params
    { id: 1, controller: 'sports' }
  end
end

module ValidParams
  def params
    { id: 1, controller: 'products' }
  end
end

module InvalidParams
  def params
    { id: 2, controller: 'products' }
  end
end

class RouteBound::Test < ActiveSupport::TestCase
  setup do
    @object = Object.new
    @object.extend(RouteBound)
    @product = Product.create(name: 'Computer')
  end

  test 'model does not exist' do
    @object.extend(BadModelParams)
    Rails.logger.expects(:info).with('RouteBound unable to find the model Sport')
    @object.route_bound_find_model
  end

  test 'model exist without matching record' do
    @object.extend(InvalidParams)
    assert_raises ActiveRecord::RecordNotFound do
      @object.route_bound_find_model
    end
  end

  test 'model and record exist' do
    @object.extend(ValidParams)
    @object.route_bound_find_model
    assert_equal @object.instance_variable_get('@product'), @product
  end
end
