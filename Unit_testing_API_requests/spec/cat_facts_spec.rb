require "cat_facts"

RSpec.describe CatFacts do
  it "returns a cool cat fact" do
    fake_requestor = double :Requestor
    expect(fake_requestor).to receive(:get).with(URI("https://catfact.ninja/fact"))
      .and_return('{"fact":"Cats only sweat through their paws and nowhere else on their body","length":65}')
    cat_facts = CatFacts.new(fake_requestor)
    expect(cat_facts.provide).to eq "Cat fact: Cats only sweat through their paws and nowhere else on their body"
  end
end