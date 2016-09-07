require 'spec_helper'

describe 'Hi5 web site' do

  describe 'on Top Navigation Bar' do
    context 'with page object' do
      before(:each) do
        visit('/')
        @top = TopNavigationBar.new
      end

      it 'shows error cause incorrect login' do
        @top.do_login('user@user.com', 'password')
        within_frame(find('#unified_login')) do
          expect(page).to have_content('The email address or password you entered is incorrect. Please try again.')
        end
      end
    end
  end

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
