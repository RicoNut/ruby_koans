require_relative 'edgecase'

class AboutIteration < EdgeCase::Koan

  def test_each_is_a_method_on_arrays
    [].methods.include?("each")
  end

  def test_iterating_with_each
    array = [1, 2, 3]
    sum = 0
    # array.each do |item|
 #      sum += item
 #    end
    # array.each { |e| sum += e }
    sum = array.inject(0) { |mem, var|  mem + var}
    assert_equal 6, sum
  end

  def test_each_can_use_curly_brace_blocks_too
    array = [1, 2, 3]
    sum = 0
    array.each { |item|
      sum += item
    }
    assert_equal 6, sum
  end

  def test_break_works_with_each_style_iterations
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    sum = 0
    array.each { |item|
      # if item > 3
#         break
#       end
    break if item > 3
      sum += item
    }
    assert_equal 6, sum
  end

  def test_collect_transforms_elements_of_an_array
    array = [1, 2, 3]
    # collect means to stream.collect
    new_array = array.collect { |item| item + 10 }
    assert_equal [11,12,13], new_array

    # NOTE: 'map' is another name for the 'collect' operation
    another_array = array.map { |item| item + 10 }
    assert_equal [11,12,13], another_array
  end

  def test_select_selects_certain_items_from_an_array
    array = [1, 2, 3, 4, 5, 6]
    # select mean to filter
    even_numbers = array.select { |item| (item % 2) == 0 }
    assert_equal [2,4,6], even_numbers

    # NOTE: 'find_all' is another name for the 'select' operation
    more_even_numbers = array.find_all { |item| (item % 2) == 0 }
    assert_equal [2,4,6], more_even_numbers
  end

  def test_find_locates_the_first_element_matching_a_criteria
    array = ["Jim", "Bill", "Clarence", "Doug2", "Eli"]
    # find means to find first
    assert_equal "Clarence", array.find { |item| item.size > 4 }
  end

  def test_inject_will_blow_your_mind
    result = [2, 3, 4].inject(0) { |sum, item| sum + item }
    assert_equal 9, result
    # array.inject(initial_val) { |a,b| exec method} initial_val as base val from exec
    result2 = [2, 3, 4].inject(1) { |sum, item| sum * item }
    assert_equal 24, result2

    # Extra Credit:
    # Describe in your own words what inject does.
  end

  def test_all_iteration_methods_work_on_any_collection_not_just_arrays
    # Ranges act like a collection
    # map: each and return a collection
    result = (1..3).map { |item| item + 10 }
    assert_equal [11,12,13], result

    # Files act like a collection of lines
    file = File.open("/Users/royleong/Repositories/kata/ruby_kata/ruby_koans/koans/example_file.txt")
    upcase_lines = file.map { |line| line.strip.upcase }
    assert_equal ["THIS","IS","A","TEST"], upcase_lines

    # NOTE: You can create your own collections that work with each,
    # map, select, etc.
  ensure
    # Arg, this is ugly.
    # We will figure out how to fix this later.
    file.close if file
  end

end
