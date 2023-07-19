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
    empty_lines = 0
    File.foreach(@file) do |line|
      empty_lines += 1 if line.strip.empty?
    end
    puts "Empty lines: #{empty_lines}"
  end

  def count_lines
    #
  end

  def count_y_symbols
    #
  end
end

FileAnalyzer.new('text.txt')
