# frozen_string_literal: true

#class Library
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
    author: 'Edith Eva Eger',
    name: 'The Choice'
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

  def find_books(finder)
    @books.select { |book| book.values_at(*finder.keys) == finder.values }
  end

  def update_book_status(id, new_status)
    book = find_books({id: id})
    if book.nil?
      puts 'Book is not found in the Library'
    else
      book[:status] = new_status
      "#{book[:name]} book new status is #{book[:status]}"
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

  def delete_book(id)
    @books.delete_if { |book| book[:id] == id }
  end

  def sort_books(sort_by, criteria = nil)
    books_to_sort = criteria == nil ? @books : find_books(criteria)
    default_book_sorting_by(books_to_sort, sort_by)
  end

  def random_book
    puts "Your random book is #{@books.sample[:name]}"
    end
  
  private
  
  def default_book_sorting_by(books, sort_by_value)
    books.sort_by! { |book| book[sort_by_value.to_sym] }
  end
  #end
puts find_books({author: 'Edith Eva Eger',  status: 'available'})