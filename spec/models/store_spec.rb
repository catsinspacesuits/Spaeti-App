require 'rails_helper'

describe Store do
  context "full address present" do
    let(:store) { Store.new(address: "Gleimstr. 23", address_line2: "Berlin", address_line3: "Germany") }

    it "should return full address" do
      expect(store.full_address).to eq "Gleimstr. 23, Berlin, Germany"
    end
  end

  context "address line 1 missing" do
    let(:store) { Store.new(address_line2: "Berlin", address_line3: "Germany") }

    it "should return address line 2 and 3 only" do
      expect(store.full_address).to eq "Berlin, Germany"
    end
  end

  context "no address present" do
    let(:store) { Store.new() }

    it "should return nothing" do
      expect(store.full_address).to eq ""
    end
  end

end

