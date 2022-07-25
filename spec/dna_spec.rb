require_relative '../models/dna'

RSpec.describe Dna do
    context "scopes" do
        let(:mutant1) { Dna.create(:dna => ["ATCG", "ATCG", "ATCG", "ATCG", "ATCG", "ATCG"], :mutant => true) }  
        let(:mutant2) { Dna.create(:dna => ["ATCG", "ATCG", "ATCG", "ATCG", ], :mutant => true) }
        let(:mutant3) { Dna.create(:dna => ["ATCG", "ATCG", "ATCG", "ATCG", "ATCG", "ATCG", "ATCG", "ATCG", "ATCG", "ATCG"], :mutant => true) }
        let(:human1) { Dna.create(:dna => ["ATCG", "GACC", "GACC"], :mutant => false) }
        let(:human2) { Dna.create(:dna => ["ATCG", "AAAA"], :mutant => false) }

        describe "::mutants" do
            it "should reeturn an array with the mutants" do
                expect(Dna.mutants).to eq [mutant1, mutant2, mutant3]
            end
        end

        describe "::humans" do
            it "should return an array with the humans" do
                expect(Dna.humans).to eq [human1, human2]
            end
        end
    end

    describe "::stats" do
        before {
            Dna.create(:dna => ["ATCG", "ATCG", "ATCG", "ATCG", "ATCG", "ATCG"], :mutant => true)

            Dna.create(:dna => ["ATCG", "ATTC", "GTCA"], :mutant => false)
            Dna.create(:dna => ["ATCG", "GACC"], :mutant => false)
            Dna.create(:dna => ["ATCG", "GACC", "GACC"], :mutant => false)
            Dna.create(:dna => ["ATCG", "AAAA"], :mutant => false)
            Dna.create(:dna => ["ATCG", "ATTT"], :mutant => false)
        }
        it "the ratio should be 0.2" do
            expect(Dna.stats[:ratio]).to eq 0.2
        end

        it "mutants should be 4" do
            expect(Dna.stats[:count_mutant_dna]).to eq 1
        end

        it "humans should be 2" do
            expect(Dna.stats[:count_human_dna]).to eq 5
        end
    end
end