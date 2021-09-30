# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
    subject do
        described_class.new(title: 'harry potter', author: 'J.K Rowling', price: 9.99, published_date: '2020-11-03')
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a name' do
        subject.title = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without an author' do
        subject.author = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without an price' do
        subject.price = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid with price being a string of characters' do
        subject.price = 'abcsd'
        expect(subject).not_to be_valid
    end

    it 'is valid with price being a string of numbers' do
        subject.price = '123.002'
        expect(subject).to be_valid
    end

    it 'is not valid with price being a mixed string of numbers and characters' do
        subject.price = 'fasdf123.0fds02'
        expect(subject).not_to be_valid
    end

    it 'is not valid without an published date' do
        subject.published_date = nil
        expect(subject).not_to be_valid
    end
end