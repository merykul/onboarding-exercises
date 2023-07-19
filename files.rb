# frozen_string_literal: true
class FileAnalyzer
  def initialize(path)
    @file = path
    count_empty_lines
    count_lines
    count_y_symbols
  end

  private

  def count_empty_lines
    if File.exist?(@file)
      empty_lines = 0
      File.foreach(@file) do |line|
        empty_lines += 1 if line.strip.empty?
      end
      puts "Empty lines: #{empty_lines}"
    else
      puts "File with #{@file} path is not found. Please, check if you entered correct path."
    end
  end

  def count_lines
    lines = File.readlines(@file).length
    puts "Lines count: #{lines}"
  end

  def count_y_symbols
    count = 0
    File.open(@file, 'r') do |file|
      file.each_line do |line|
        words = line.split(" ")
        words.each do |word|
          word.each_char do |char|
            count += 1 if 'y'.include?(char)
          end
        end
      end
    end
    puts "File has #{count} y"
  end
end

FileAnalyzer.new('text.txt')
