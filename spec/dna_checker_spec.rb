require "dna_checker"

RSpec.describe DNAChecker, "#isMutant" do
    subject(:dna_checker) { DNAChecker.new }

    context "when the dna has differents sequences" do
        let(:dna) { ["ATGCGA", "CAGTGC", "TTATGT", "AGAAGG", "CCCCTA", "TCACTG"] }
        
        it "should be a mutant" do
            expect(dna_checker.isMutant(dna)).to eq true
        end
    end
    
    context "when the dna has horizontal sequences" do
        let(:dna) { ["AAAAGG", "ACTGAA", "CTGGGG"] }
        
        it "should be a mutant" do
            expect(dna_checker.isMutant(dna)).to eq true
        end
    end

    context "when the dna has vertical sequences" do
        let(:dna) { ["ACGTAA", "ACGTAA", "ACGTAA", "ACGTAA"] }

        it "should be a mutant" do
            expect(dna_checker.isMutant(dna)).to eq true
        end
    end

    context "when the dna has diagonal sequences" do
        let(:dna) { ["ACGTA", "AACTA", "ACACA", "ACGAC"] }

        it "should be a mutant" do
            expect(dna_checker.isMutant(dna)).to eq true
        end
    end

    context "when the dna has backslash sequences" do
        let(:dna) { ["ACTGCC", "ATGCCA", "TGTCGGT", "GGCCCAT"] }

        it "should be a mutant" do
            expect(dna_checker.isMutant(dna)).to eq true
        end
    end

    context "when the dna doesn't has any sequences" do
        let(:dna) { ["ACGTAAA", "ACGTAAA"] }

        it "shouldn't be a mutant" do
            expect(dna_checker.isMutant(dna)).to eq false
        end
    end

    context "when the dna has only one sequence" do
        let(:dna) { ["ACGTAAA", "ACGAAAA"] }

        it "shouldn't be a mutant" do
            expect(dna_checker.isMutant(dna)).to eq false
        end
    end
end