require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'has a valid factory' do
    item = build :item
    expect(item).to be_valid
  end

  describe 'validations' do
    it 'should be invalid if an attribute is missing' do
      item = build :item, description: ''
      expect(item).to be_invalid
    end

    it 'should be valid with all attributes' do
      item = build :item
      expect(item).to be_valid
    end
  end

  describe 'associations' do
    it 'should belong to a store' do
      store = create :store
      item = create :item, store: store

      expect(item.store).to eq(store)
    end
  end
end
