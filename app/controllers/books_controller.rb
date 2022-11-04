class BooksController < ApplicationController
    before_action(:set_book, only: [:show, :update, :destroy])

    def index
        books = Book.all 
        render json: books
    end

    def create
        book = Book.create!(book_params)
        render json: book, status: :created
    end

    def show
        render json: @book
    end

    def update
        @book.update(book_params)
        render json: @book, status: :ok
    end
    
    def destroy
        @book.destroy 
        head :no_content
    end
    
    private

    def set_book
        @book = Book.find_by(id: params[:id])
        if !@book 
            render_not_found
        end
    end

    def render_not_found
        render json: { errors: ["Book with id of #{params[:id]} does not exist"]}, status: :not_found
    end

    def book_params
        params.require(:book).permit(:id, :title, :author, :description, :cover_image_url)
    end
end
