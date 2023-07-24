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

  def find_books(criteria)
    matched_books = []
    criteria.each do |key, value|
      matched_books = @books.select { |book| book[key] == value }
    end
    puts matched_books
  end

  def update_book_status(id, new_status)
    book = find_books({id: id})
    if book.nil?
      puts 'Book is not found in the Library'
    else
      book[:status] = new_status
      puts "#{book[:name]} book new status is #{book[:status]}"
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
    default_book_sorting_by(sort_by) unless criteria != nil
    selected_books_to_sort = find_books(criteria)
    sorted_books = selected_books_to_sort.sort_by! { |book| book[sort_by.to_sym] }
    puts sorted_books
  end

  def random_book
    puts "Your random book is #{@books.sample[:name]}"
    end
  
  private
  
  def default_book_sorting_by (sort_by_value) 
    sorted_books = @books.sort_by! { |book| book[sort_by_value.to_sym] } 
    puts sorted_books 
  end
end
