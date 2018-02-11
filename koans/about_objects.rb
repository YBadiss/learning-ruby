require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutObjects < Neo::Koan
  def test_everything_is_an_object
    objects = [1, 1.5, "string", nil, Object]
    objects.each { |x| assert x.is_a?(Object) }
  end

  def test_objects_can_be_converted_to_strings
    assert_equal "123", 123.to_s
    assert_equal "", nil.to_s
  end

  def test_objects_can_be_inspected
    assert_equal "123", 123.inspect
    assert_equal "nil", nil.inspect
  end

  def test_every_object_has_an_id
    obj = Object.new
    assert obj.object_id.is_a?(Integer)
  end

  def test_every_object_has_different_id
    obj = Object.new
    another_obj = Object.new
    assert obj.object_id != another_obj.object_id
  end

  def test_small_integers_have_fixed_ids
    0.upto(100) { |x| assert_equal 2 * x + 1, x.object_id }

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow?
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    copy = obj.clone

    assert obj != copy
    assert obj.object_id != copy.object_id
  end
end
