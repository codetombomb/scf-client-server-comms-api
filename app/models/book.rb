class Book < ApplicationRecord
    has_many :user_books
    has_many :readers, through: :user_books, source: :user, dependent: :destroy

    # Validate title for each author - no duplicate titles for the same author
    validates :title, uniqueness: { scope: :author, message: "for this author has already been created in the DB. Please try again." }
    validate :cover_url_format

    # before_validation :downcase_img_url

    # def downcase_img_url
    #     self.cover_image_url = self.cover_image_url.downcase
    # end

    def cover_url_format
        space_check = self.cover_image_url.split(" ")
        if space_check.length > 1
            #Add errors to validations
            errors.add(:cover_image_url, "URL cannot contian spaces")
        end
        if self.cover_image_url.downcase.match("http").nil?
            errors.add(:cover_image_url, "must start with http or https")
        end
    end

# - No spaces
# - Must end in top-level domain or image format (ex: ‘.com’, ‘.net’. ‘.jpeg’, ‘.png’)
# - Must start with ‘http’ to be a valid URL  
#  cover_image_url: "https://www.tddapps.com/images/books/cracking-the-coding-interview.png"
end
