require "time_error"

RSpec.describe TimeError do
  it "returns difference in seconds between server time and the time on this computer" do
    time_now = Time.new(2022, 07, 27, 11, 37, 42) 
    fake_requestor = double :FakeRequestor
    expect(fake_requestor).to receive(:get).with("www.worldtimeapi.org", "/api/ip").and_return('{"abbreviation":"BST","client_ip":"2a02:c7e:63f:800:64f3:db1c:bdae:d62d","datetime":"2022-07-27T11:37:42.483728+01:00","day_of_week":3,"day_of_year":208,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1658918262,"utc_datetime":"2022-07-27T10:37:42.483728+00:00","utc_offset":"+01:00","week_number":30}')
    time_error = TimeError.new(fake_requestor)
    expect(time_error.error(time_now)).to eq 0.483728
  end
end