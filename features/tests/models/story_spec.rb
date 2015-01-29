require 'rspec'
require_relative '../../features/models/story'
include Estimator::Models

describe Story do

  describe 'generating fibonnaci sequence' do


    describe 'when invoked with a number' do
      let(:fib_count) { 0 }
      let(:subject) { Story.generate_sequence_up_to fib_count }

      it 'returns an array of fibonnaci numbers' do
        expect(subject).to be_a Array
      end

      it 'returns an array with a length equal to the number number passed plus one (zero)' do
        expect(subject.count).to eq(fib_count + 1)
      end
    end


    describe 'calculating a fibonnaci number' do

      describe 'when passed 6' do
        let(:subject) { Story.fibonnaci 6 }

        it 'results in 8' do
          expect(subject).to equal(8)
        end

      end


      describe 'when passed 0' do
        let(:subject) {Story.fibonnaci 0}

        it 'equals zero' do
          expect(subject).to equal(0)
        end

      end


      describe 'when passed 1' do
        let(:subject) {Story.fibonnaci 1}
        it 'equals 1'do
          expect(subject).to equal(1)
        end


      end

    end


  end

end
