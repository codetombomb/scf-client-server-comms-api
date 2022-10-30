require 'pry'

class User

    attr_accessor :username, :bio, :email
    @@all = []

    def initialize(params = {})
        # @username = params[:username]
        # @bio = bio
        # @email = email
        params.each do |key, value|
            # binding.pry
            # "@#{key}=" value
            self.send("#{key}=", value)
            binding.pry
        end
        @@all << self
        
    end

    def self.all
        @@all
    end
end


elon = User.new({username: "Elon", email: "elon@spacex.com", bio: "Mars fan"})

# elon = User.new("Elon","Mars fan","elon@spacex.com")
# eri = User.new("Super awesome coder","eri@gmail.com","eriguzman2022")

binding.pry