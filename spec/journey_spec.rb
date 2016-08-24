require 'journey'

describe Journey do

  let(:journey) {described_class.new('start')}

  describe 'a journey' do

    before do
      journey.start_check
    end

    it 'initializes with a starting station' do
      expect(journey.start).to eq 'start'
    end

  context 'did not complete a journey' do

    it 'charges penalty if previous journey not completed' do
        expect(journey.start_check).to eq Journey::PENALTY
    end
  end
  
    it 'knows the journey is in progress' do
      expect(journey.complete?).to eq false
    end

    it 'can charge a minimum fare when journey is completed' do
      expect(journey.finish_check).to eq Journey::MINIMUM_FARE
    end

    it 'can complete a journey' do
      journey.finish_check
      expect(journey.complete?).to eq true
    end
  end

  context 'did not start a journey but attempt to finish' do
    it 'charges penalty if no journey was started' do
      expect(journey.finish_check).to eq Journey::PENALTY
    end
  end


end

# a person touches in their oyster card
# -they did not touch out previously, so need to be charged penalty fare
# if not complete, charge penalty
# -they did touch in, so they are not charged
#
# the person now goes to touch out their oyster charged
# -they did not touch in, so they are charged penalty
# if complete already, charge penalty
# -they did touch in, and they are charged the fare
