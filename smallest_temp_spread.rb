# Problem: In the attached file (w_data.dat), you’ll find daily weather data. Download this text file, then write a program to output the day number (column one) with the smallest temperature spread (the maximum temperature is the second column, the minimum the third column).

# Solution proposed:
# 1. Read the file located at data/w_data.dat
# 2. Set variable to store the smallest temperature spread
# 3. Loop through each line valid to the data (avoiding the header)
# 4. Calculate the temperature spread for each day and compare to the current value
# 5. Print the day and the temperature spread

filename = 'data/w_data.dat'

smallest_tmp_spread = 10_000.0
day = 0

File.open(filename, 'r') do |file|
  file.each_line do |line|
    next unless line =~ /  1/
    
    line_data = line.split
    temp_spread = line_data[1].to_f - line_data[2].to_f
    smallest_tmp_spread, day = temp_spread, line_data[0] if temp_spread < smallest_tmp_spread
  end
end

puts "Smallest temperature spread was #{smallest_tmp_spread} on the #{day}th day"
