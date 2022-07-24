require "dna_checker"
require_relative '../models/dna'

RSpec.shared_examples "database related" do
    it "should save the dna" do
        expect { dna_checker.isMutant(dna) }.to change { Dna.count }.by(1)
    end
end

RSpec.shared_examples "mutant related" do
    it "should be a mutant" do
        expect(dna_checker.isMutant(dna)).to eq true
    end

    it "should save a the dna as a mutant" do
        dna_checker.isMutant(dna)

        expect(Dna.first.mutant).to eq true
    end
end

RSpec.shared_examples "human related" do
    it "shouldn't be a mutant" do
        expect(dna_checker.isMutant(dna)).to eq false
    end

    it "should save a the dna as a human" do
        dna_checker.isMutant(dna)

        expect(Dna.first.mutant).to eq false
    end
end

RSpec.describe DNAChecker, "#isMutant" do
    subject(:dna_checker) { DNAChecker.new }

    context "when the dna has differents sequences" do
        let(:dna) { ["ATGCGA", "CAGTGC", "TTATGT", "AGAAGG", "CCCCTA", "TCACTG"] }
        
        include_examples "mutant related"
        include_examples "database related"

        it "should not repeat a dna record" do
            dna_checker.isMutant(dna)
            
            expect { dna_checker.isMutant(dna) }.not_to change { Dna.count }
        end
    end
    
    context "when the dna has horizontal sequences" do
        let(:dna) { ["AAAAGG", "ACTGAA", "CTGGGG"] }
        
        include_examples "mutant related"
    end

    context "when the dna has vertical sequences" do
        let(:dna) { ["ACGTAA", "ACGTAA", "ACGTAA", "ACGTAA"] }

        include_examples "mutant related"
    end

    context "when the dna has diagonal sequences" do
        let(:dna) { ["ACGTA", "AACTA", "ACACA", "ACGAC"] }

        include_examples "mutant related"
    end

    context "when the dna has backslash sequences" do
        let(:dna) { ["ACTGCC", "ATGCCA", "TGTCGGT", "GGCCCAT"] }

        include_examples "mutant related"
    end

    context "when the dna doesn't has any sequences" do
        let(:dna) { ["ACGTAAA", "ACGTAAA"] }

        include_examples "human related"
        include_examples "database related"
    end

    context "when the dna has only one sequence" do
        let(:dna) { ["ACGTAAA", "ACGAAAA"] }

        include_examples "human related"
    end
end