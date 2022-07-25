class Dna < ActiveRecord::Base
    validates :dna, presence: true, uniqueness: true

    scope :mutants, -> { where(mutant: true) }
    scope :humans, -> { where(mutant: false) }

    def self.stats
        mutants = Dna.mutants.count
        humans = Dna.humans.count
        ratio = mutants.to_f / humans.to_f

        {
            :count_mutant_dna => mutants,
            :count_human_dna => humans,
            :ratio => ratio
        }
    end
end