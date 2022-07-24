require_relative '../models/dna'

class DNAChecker
    VALID_SEQUENCES = ["AAAA", "TTTT", "CCCC", "GGGG"]
    SEQUENCE_LENGTH = 4
    NEEDED_SEQUENCES = 2

    private_constant :VALID_SEQUENCES, :SEQUENCE_LENGTH, :NEEDED_SEQUENCES

    attr :matrix, :rows, :cols, :founded_sequences

    def isMutant(dna)
        setDna(dna)

        for i in 0..(rows-1)
            for j in 0..(cols-1)
                checkHorizontalSequence(i, j)
                checkVerticalSequence(i, j)
                checkDiagonalSequence(i, j)
                checkBackslashSequence(i, j)
            end
            
        end

        
        dna = Dna.create(
            :dna => dna,
            :mutant => founded_sequences.size >= NEEDED_SEQUENCES
        )

        return dna.mutant
    end

    private

    def setDna(dna)
        @rows = dna.size
        @cols = dna[0].chars.size

        @matrix = []
        @matrix = dna.map { |row| row.chars }

        @founded_sequences = []
    end

    def checkHorizontalSequence(i, j)
        return unless cols - j >= SEQUENCE_LENGTH && cols >= SEQUENCE_LENGTH
        sequence = matrix[i][j] + matrix[i][j+1] + matrix[i][j+2] + matrix[i][j+3]
        return unless VALID_SEQUENCES.include?(sequence)

        founded_sequences << sequence
    end

    def checkVerticalSequence(i, j)
        return unless rows - i >= SEQUENCE_LENGTH && rows >= SEQUENCE_LENGTH
        sequence = matrix[i][j] + matrix[i+1][j] + matrix[i+2][j] + matrix[i+3][j]
        return unless VALID_SEQUENCES.include?(sequence)

        founded_sequences << sequence
    end
    
    def checkDiagonalSequence(i, j)
        return unless rows - i >= SEQUENCE_LENGTH && cols - j >= SEQUENCE_LENGTH && rows >= SEQUENCE_LENGTH && cols >= SEQUENCE_LENGTH
        sequence = matrix[i][j] + matrix[i+1][j+1] + matrix[i+2][j+2] + matrix[i+3][j+3]
        return unless VALID_SEQUENCES.include?(sequence)

        founded_sequences << sequence
    end

    def checkBackslashSequence(i, j)
        return unless i + 1 >= SEQUENCE_LENGTH && cols - j >= SEQUENCE_LENGTH && rows >= SEQUENCE_LENGTH && cols >= SEQUENCE_LENGTH
        sequence = matrix[i][j] + matrix[i-1][j+1] + matrix[i-2][j+2] + matrix[i-3][j+3]
        return unless VALID_SEQUENCES.include?(sequence)

        founded_sequences << sequence
    end
end