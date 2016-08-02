class NYCSchoolCLI

  def run
    schools_array
    create_school_objects(schools_array)
    greeting
  end

  def greeting
    puts "Welcome to NYC Schools search.\nWould you like to view Top 10 scores by Verbal, Math, Writing or Total Scores?"
    answer = gets.strip.downcase
    if answer == "verbal"
      print_top_ten_by_verbal
    elsif answer == "math"
      print_top_ten_by_math
    elsif answer == "writing"
      print_top_ten_by_writing
    elsif answer == "total"
      print_top_ten_by_total
    elsif answer== "exit"
      return
    else
      puts "That's not a choice"
    end
    greeting
  end


  def schools_array
    NYCSchoolsAPIWrapper.new.all_schools_hash
  end

  def create_school_objects(schools_array)
    schools_array.each do |school_hash|
      Schools.new(school_hash["school_name"], school_hash["sat_critical_reading_avg_score"].to_i, school_hash["sat_math_avg_score"].to_i, school_hash["sat_writing_avg_score"].to_i)
    end
  end

  def print_top_ten_by_total
    Schools.sort_by_total_score[0..10].each_with_index do |school, index|
      puts "#{index+1}. #{school.name} => #{school.total_score}"
    end
  end

  def print_top_ten_by_verbal
    Schools.sort_by_vscore[0..10].each_with_index do |school, index|
      puts "#{index+1}. #{school.name} => #{school.vscore}"
    end
  end

  def print_top_ten_by_math
    Schools.sort_by_mscore[0..10].each_with_index do |school, index|
      puts "#{index+1}. #{school.name} => #{school.mscore}"
    end
  end

  def print_top_ten_by_writing
    Schools.sort_by_wscore[0..10].each_with_index do |school, index|
      puts "#{index+1}. #{school.name} => #{school.wscore}"
    end
  end


end
