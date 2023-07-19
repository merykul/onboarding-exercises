# frozen_string_literal: true

class Library
  @books = []

  book1 = {
    id: @books.length + 1,
    year: 1956,
    status: 'available',
    author: 'Lucy Maud Montgomery',
    name: 'Anne of Green Gables'
  }
  @books << book1

  book2 = {
    id: @books.length + 1,
    year: 1985,
    status: 'unavailable',
    author: 'Robin Norwood',
    name: 'Women Who Love Too Much'
  }
  @books << book2

  book3 = {
    id: @books.length + 1,
    year: 2020,
    status: 'available',
    author: 'Edith Eva Eger',
    name: 'The Gift'
  }
  @books << book3

  def find_book(search_variable)
    @books.any? { |book| book.values.include?(search_variable) }
  end

  def update_book_status(id, new_status)
    book = @books.find { |book| book[:id] == id }
    if book
      book[:status] = new_status
      puts "#{book[:name]} book new status is #{book[:status]}"
    else
      puts 'Book is not found in the Library'
    end
  end

  def acquire_new_book(author, year, status, name)
    book = {
      id: @books.length + 1,
      year: year,
      status: status,
      author: author,
      name: name
    }
    @books << book
  end
end
