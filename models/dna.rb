class Dna < ActiveRecord::Base
    validates :dna, presence: true
    validates :mutant, presence: true
end