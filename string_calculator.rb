class StringCalculator
  attr_accessor :string

  def add(string)
    @string = string
    return 0 if string.empty?

    return string.to_i unless single_number?

    update_string_seperators

    throw_error_if_negative

    return add_comma_numbers if string.include?(',')
  end

  def throw_error_if_negative
    if string.include?('-')
      negatives = string_array.select { |i| i < 0 }.join(',')
      raise "Negative Numbers are #{negatives}"
    end
  end

  def update_string_seperators
    string.gsub!("\n", ',')
    return string unless string[0..1] == '//'

    replace_string = string[2]
    string.delete_prefix("//#{replace_string}")
    string.gsub!(replace_string, ',')
  end

  def single_number?
    (string.split('') & [',', '/']).any?
  end

  def add_comma_numbers
    string_array.reduce(:+)
  end

  def string_array
    string.split(',').map(&:to_i)
  end
end
