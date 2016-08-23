require 'station'

describe Station do

  describe 'station aldgate' do
      let(:station) {described_class.new("aldgate", 1)}
      it 'should return station as aldgate' do
        expect(station.instance_variable_get(:@name)).to eq("aldgate")
      end
      it 'should return the zone of the station' do
        expect(station.instance_variable_get(:@zone)).to eq(1)
      end
  end


end
