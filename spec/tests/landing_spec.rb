require 'spec_helper'

describe 'Hi5 web site' do

  describe 'on Footer Navigation Bar ' do
    context 'without page object' do
      before(:each) do
        visit('/')
      end

      it 'clicks Mobile button successfully' do
        click_link('Mobile')
        expect(page).to have_content('Meet people on the go.')
      end

      it 'clicks Company button successfully' do
        find('.footer_nav').find_link('Company').click
        expect(page).to have_content('A reverence for')
      end
    end

    context 'with page object' do
      before(:each) do
        visit('/')
        @footer = FooterNavigationBar.new
      end

      it 'clicks Mobile button successfully' do
        @footer.click_mobile
        expect(page).to have_content('Meet people on the go.')
      end

      it 'clicks Company button successfully' do
        @footer.click_company
        expect(page).to have_content('A reverence for')
      end
    end
  end
end
