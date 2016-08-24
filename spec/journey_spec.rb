require 'journey'

describe Journey do

  let(:journey) {described_class.new('start')}

  it {is_expected.to respond_to :fare}

  it 'initializes with a start' do
    expect(journey.start).to eq 'start'
  end

  it 'starts a journey' do
    expect(journey.complete?).to eq false
  end

  it 'can calculate a fare' do
    expect(journey.fare).to eq Journey::MINIMUM_FARE
  end

  # it 'wants to know if the journey is complete' do
  #   expect(journey.complete?).to be false
  # end

  it 'charges a penalty fare if you don\'t touch in or touch out' do
    expect(journey.pen_fare).to eq Journey::PENALTY
  end

  it 'can complete a journey' do
    expect(journey.complete).to eq true
  end

end

a person touches in their oyster card
-they did not touch out previously, so need to be charged penalty fare
if not complete, charge penalty
-they did touch in, so they are not charged

the person now goes to touch out their oyster charged
-they did not touch in, so they are charged penalty
if complete already, charge penalty
-they did touch in, and they are charged the fare
