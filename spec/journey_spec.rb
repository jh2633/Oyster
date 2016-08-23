require 'journey'

describe Journey do
  let(:entry_station) {double(:entry_station)}
  let(:journey) {described_class.new(entry_station)}
  it 'is initialized with the entry station' do
    expect(journey.instance_variable_get(:@entry_station)).to eq entry_station
  end
end
