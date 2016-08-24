require 'journey'

describe Journey do

  let(:journey) {described_class.new('start')}

  it {is_expected.to respond_to :fare}

  it 'initializes with a start' do
    expect(Journey.new('start').start).to eq 'start'
  end

  it 'starts a journey' do


  end

  it 'can calculate a fare' do

  end

  it 'knows the current status of the journey' do

  end

  it 'charges a penalty fare if you don\'t touch in or touch out' do

  end

  it 'can complete a journey' do

  end

end
