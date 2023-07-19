  # frozen_string_literal: true
class Library
  book1 = {
    id: 1,
    year: 1956,
    status: 'available',
    author: 'Lucy Maud Montgomery',
    name: 'Anne of Green Gables'
  }

  book2 = {
    id: 2,
    year: 1985,
    status: 'unavailable',
    author: 'Robin Norwood',
    name: 'Women Who Love Too Much'
  }

  book3 = {
    id: 3,
    year: 2020,
    status: 'available',
    author: 'Edith Eva Eger',
    name: 'The Gift'
  }

  books = {
    book1[:id] => book1,
    book2[:id] => book2,
    book3[:id] => book3
  }

  def find_book(books, search_variable)
    search_result = books.values.select do |book|
      [book[:author], book[:name], book[:id]].include?(search_variable)
    end
    puts search_result
  end

  def update_book_status(books, id, new_status)
    if books.key?(id)
      books[id][:status] = new_status
      puts "#{books[id][:name]} book new status is #{books[id][:status]}"
    else
      puts 'Book is not found in the Library'
    end
  end

  def acquire_new_book(books, id, author, year, status, name)
    book = {
      id: id,
      year: year,
      status: status,
      author: author,
      name: name
    }
    books[id] = book

    books.each do |id, book|
      puts "Book ID: #{id}"
      puts "Name: #{book[:name]}"
    end
  end
end
