require 'rspec'
require_relative '../../fibonnaci/fibonnaci'

describe 'Estimator::Fibonnaci' do

  describe 'calculating a fibonnaci number' do

    describe 'for a value of 0' do
      let(:subject) { Estimator::Fibonnaci.calculate 0 }
      it 'equals zero' do
        expect(subject).to eq(0)
      end
    end

    describe 'for a value of 1' do
      let(:subject) { Estimator::Fibonnaci.calculate 1 }
      it 'equals 1' do
        expect(subject).to eq(1)
      end
    end

    describe 'for a value of 2' do
      let(:subject) { Estimator::Fibonnaci.calculate 2 }
      it 'equals 1' do
        expect(subject).to eq(1)
      end
    end

    describe 'for a value of 6' do
      let(:subject) { Estimator::Fibonnaci.calculate 6 }
      it 'equals 8' do
        expect(subject).to eq(8)
      end
    end

  end

  describe 'validating fibonnaci numbers' do

    describe 'when the number provided is a valid fibonnaci number' do
      let (:subject) { Estimator::Fibonnaci.valid? 21 }
      it 'returns true' do
        expect(subject).to be_truthy
      end
    end

    describe 'when the number provided is not a valid fibonnaci number' do
      let(:subject) { Estimator::Fibonnaci.valid? 4 }
      it 'returns false' do
        expect(subject).to be_falsey
      end
    end
  end

  describe 'finding the closest valid fibonnaci number' do

    describe 'when given a valid of 2' do
      let(:subject) { Estimator::Fibonnaci.closest 2 }
      it 'returns 2' do
        expect(subject).to eq(2)
      end
    end


    describe 'when given a value of 6' do
      let(:subject) { Estimator::Fibonnaci.closest 6 }
      it 'returns 5' do
        expect(subject).to eq(5)
      end
    end

  end
end