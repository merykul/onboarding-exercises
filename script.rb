command = ARGV.empty? ? (puts 'Please pass argument to the script') : ARGV[0]

result = system(command)

if result
  puts 'Completed successfully'
else
  puts 'Failed to run'
end
