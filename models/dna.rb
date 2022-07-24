class Dna < ActiveRecord::Base
    validates :dna, presence: true, uniqueness: true
end