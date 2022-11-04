class BooksController < ApplicationController

    def index
        books = Book.all 
        render json: books
    end

    def create
        
    end

    def show
        book = Book.find_by(id: params[:id])
        if book
            render json: book
        else
            render json: { errors: ["Book with id of #{params[:id]} does not exist"]}, status: :not_found
        end
    end

    def update
        book = Book.find_by(id: params[:id])
        if book
            book.update(book_params)
            render json: book, status: :ok
        else
            render json: { errors: ["Book with id of #{params[:id]} does not exist"]}, status: :not_found
        end
    end
    
    def destroy
        book = Book.find_by(id: params[:id])
        if book
            book.destroy
            head :no_content
        else
            render json: { errors: ["Book with id of #{params[:id]} does not exist"]}, status: :not_found
        end
    end
    private

    def book_params
        params.require(:book).permit(:id, :title, :author, :description, :cover_image_url)
    end
end
