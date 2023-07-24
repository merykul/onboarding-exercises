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
    count_lines_with_y
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

  def count_lines_with_y
    lines_with_y_symbol = 0
    File.foreach(@file) { |line| lines_with_y_symbol += 1 if line.include?('y') }
    puts "File has #{lines_with_y_symbol} y"
  end
end

FileAnalyzer.new('onboarding-exercises/text.txt')
FileAnalyzer.new('invalid.txt')
