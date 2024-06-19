# Problem: The attached soccer.dat file contains the results from the English Premier League. The columns labeled ‘F’ and ‘A’ contain the total number of goals scored for and against each team in that season (so Arsenal scored 79 goals against opponents, and had 36 goals scored against them). Write a program to print the name of the team with the smallest difference in ‘for’ and ‘against’ goals.

# Solution proposed:
# 1. Read the file located at data/soccer.dat
# 2. Set variable to store the smallest diff in goals
# 3. Loop through each line (avoiding the header or not valid line)
# 4. Calculate the difference of F and A for each team
# Assuming if line is splitted the col[6] is the F and col[8] is the A
# 5. Compare to the current value
# 6. Print the team and the smallest difference

filename = 'data/soccer.dat'

diff_fa = 10_000.0
team = ''

File.open(filename, 'r') do |file|
  file.each_line do |line|
    next unless line =~ /  1/
    
    line_data = line.split
    tmp_diff_fa = line_data[6].to_i - line_data[8].to_i
    diff_fa, team = tmp_diff_fa, line_data[1] if tmp_diff_fa < diff_fa
  end
end

puts "Smallest difference in ‘for’ and ‘against’ goals is #{diff_fa.abs} for the #{team} team"
