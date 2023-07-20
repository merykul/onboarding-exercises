command = ARGV.empty? ? (puts 'Please pass argument to the script') : ARGV[0]

if command
  result = system(command)

  if result
    puts 'Completed successfully'
    puts command.to_s
  else
    puts 'Failed to run'
  end
end
