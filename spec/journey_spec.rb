require 'journey'

describe Journey do

  let(:journey) {described_class.new('start')}

  describe 'a journey' do

    before do
      journey.start_check
    end


    it 'initializes with a start' do
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
  end

  it 'charges penalty if no journey was started' do
    journey.start_check
    journey.finish_check
    expect(journey.finish_check).to eq Journey::PENALTY
  end

  it 'can calculate a fare' do
    expect(journey.fare).to eq Journey::MINIMUM_FARE
  end

  it 'charges a penalty fare if you don\'t touch in or touch out' do
    expect(journey.pen_fare).to eq Journey::PENALTY
  end

  it 'can complete a journey' do
    expect(journey.finish_check).to eq true
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
