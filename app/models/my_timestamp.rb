class MyTimestamp
  attr_accessor :unix, :natural

  def initialize(raw_timestamp)
    if is_unix?(raw_timestamp)
      @unix = raw_timestamp
      @natural = convert_to_natural(raw_timestamp)
    else
      my_date = check_date_format(raw_timestamp)
      if my_date.nil?
        @unix = nil
        @natural = nil
      else
        @unix = my_date.to_time.to_i
        @natural = my_date.strftime("%B %e, %Y")
      end
    end
  end

  def is_unix?(input)
    return /^[-0-9]*$/.match(input) ? true : false
  end

  def convert_to_natural(unix_timestamp)
    return DateTime.strptime(unix_timestamp,'%s').strftime("%B %e, %Y")
  end

  def check_date_format(input)
    # if there is a comma, take it out before attempting to parse the date
    input = input.gsub(/,/, '')
    begin
      my_date = DateTime.strptime(input,'%B %e %Y')
    rescue ArgumentError
      my_date = nil
    end
    return my_date
  end

end