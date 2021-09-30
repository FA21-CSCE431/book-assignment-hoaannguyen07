# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    scenario 'with valid inputs' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Author', with: 'J.K Rowling'
        fill_in 'Price', with: '9.99'
        fill_in 'book[published_date]', with: '2020-11-03'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('harry potter')
    end

    scenario 'without valid title (none at all)' do
        visit new_book_path
        fill_in 'Author', with: 'Rick Riordan'
        fill_in 'Price', with: '9.99'
        fill_in 'book[published_date]', with: '2015-08-03'
        click_on 'Create Book'
        visit books_path
        expect(page).to_not have_content('Percy Jackson')
    end

    scenario 'without valid author (none at all)' do
        visit new_book_path
        fill_in 'Title', with: 'Percy Jackson'
        fill_in 'Price', with: '9.99'
        fill_in 'book[published_date]', with: '2015-08-03'
        click_on 'Create Book'
        visit books_path
        expect(page).to_not have_content('Percy Jackson')
    end

    scenario 'without valid price (all characters)' do
        visit new_book_path
        fill_in 'Title', with: 'The Martian'
        fill_in 'Author', with: 'Andy Weir'
        fill_in 'Price', with: 'abcd'
        fill_in 'book[published_date]', with: '2020-11-03'
        click_on 'Create Book'
        visit books_path
        expect(page).to_not have_content('The Martian')
    end

    scenario 'without valid price (characters mixed with numbers)' do
        visit new_book_path
        fill_in 'Title', with: 'The Martian'
        fill_in 'Author', with: 'Andy Weir'
        fill_in 'Price', with: 'asbs1234'
        fill_in 'book[published_date]', with: '2020-11-03'
        click_on 'Create Book'
        visit books_path
        expect(page).to_not have_content('The Martian')
    end

    scenario 'without valid price (characters mixed with numbers)' do
        visit new_book_path
        fill_in 'Title', with: 'The Martian'
        fill_in 'Author', with: 'Andy Weir'
        fill_in 'Price', with: '14.03av'
        fill_in 'book[published_date]', with: '2020-11-03'
        click_on 'Create Book'
        visit books_path
        expect(page).to_not have_content('The Martian')
    end

    scenario 'without valid price (characters mixed with numbers)' do
        visit new_book_path
        fill_in 'Title', with: 'The Martian'
        fill_in 'Author', with: 'Andy Weir'
        fill_in 'Price', with: 'abc.1039as'
        fill_in 'book[published_date]', with: '2020-11-03'
        click_on 'Create Book'
        visit books_path
        expect(page).to_not have_content('The Martian')
    end

    scenario 'without price' do
        visit new_book_path
        fill_in 'Title', with: 'The Martian'
        fill_in 'Author', with: 'Andy Weir'
        fill_in 'book[published_date]', with: '2020-11-03'
        click_on 'Create Book'
        visit books_path
        expect(page).to_not have_content('The Martian')
    end

    scenario 'without valid published date' do
        visit new_book_path
        fill_in 'Title', with: 'Atomic Habits'
        fill_in 'Author', with: 'James Clear'
        fill_in 'Price', with: '11.98'
        fill_in 'book[published_date]', with: 'asdfdas'
        click_on 'Create Book'
        visit books_path
        expect(page).to_not have_content('Atomic Habits')
    end

    scenario 'without published date' do
        visit new_book_path
        fill_in 'Title', with: 'Atomic Habits'
        fill_in 'Author', with: 'James Clear'
        fill_in 'Price', with: '11.98'
        click_on 'Create Book'
        visit books_path
        expect(page).to_not have_content('Atomic Habits')
    end
end