class BooksController < ApplicationController

    def index 
        books = Book.all
        render json: books, status: :ok
    end

    def create
        debugger
    end
end
