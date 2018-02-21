require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutNil < Neo::Koan
  def test_nil_is_an_object
    assert nil.is_a?(Object), "Unlike NULL in other languages"
  end

  def test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil
    err = assert_raise NoMethodError do
      nil.some_method_nil_doesnt_know_about
    end
    assert_match /undefined method/, err.message
  end

  def test_nil_has_a_few_methods_defined_on_it
    assert nil.nil?
    assert_equal "", nil.to_s
    assert_equal "nil", nil.inspect
  end

end
