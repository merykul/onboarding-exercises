# frozen_string_literal: true
class FileAnalyzer
  def initialize(path)
    @file = path
    file_analyze
  end

  private

  def file_analyze
    return puts 'File name is not valid, please check spelling or existence of the file' unless File.exist?(@file)

    count_empty_lines
    count_lines
    count_y_symbols
  end

  def count_empty_lines
    empty_lines = 0
    File.foreach(@file) { |line| empty_lines += 1 if line.strip.empty? }
    puts "Empty lines: #{empty_lines}"
  end

  def count_lines
    lines = File.readlines(@file).length
    puts "Lines count: #{lines}"
  end

  def count_y_symbols
    count_y = 0
    File.open(@file, 'r') do |file|
      file.each_line do |line|
        words = line.split(' ')
        words.each do |word|
          word.each_char { |char| count_y += 1 if char == 'y' }
        end
      end
    end
    puts "File has #{count_y} y"
  end
end

FileAnalyzer.new('text1.txt')
