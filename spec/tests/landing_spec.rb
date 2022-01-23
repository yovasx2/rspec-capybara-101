# frozen_string_literal: true

require 'spec_helper'

describe 'Hi5 web site' do
  describe 'on Top Navigation Bar' do
    context 'with page object' do
      before do
        visit('/')
        @top = TopNavigationBar.new
      end

      it 'shows error cause incorrect login' do
        @top.do_login('user@user.com', 'password')
        within_frame('unified_login') do
          # his is bad, Capybara waits upto Capybara.default_max_wait_time seconds
          # but somehow driver seems to have problem without that sleep
          #      Selenium::WebDriver::Error::UnknownError:
          #        TypeError: a is null
          #      # bc@chrome://remote/content/marionette/atom.js:92:192
          #      # d@chrome://remote/content/marionette/atom.js:86:42
          #      # ac@chrome://remote/content/marionette/atom.js:87:238
          #      # fc@chrome://remote/content/marionette/atom.js:88:436
          #      # jc@chrome://remote/content/marionette/atom.js:96:339
          #      # oc@chrome://remote/content/marionette/atom.js:101:95
          #      # atom.getElementText/</<@chrome://remote/content/marionette/atom.js:104:295
          #      # atom.getElementText/<@chrome://remote/content/marionette/atom.js:104:481
          #      # atom.getElementText@chrome://remote/content/marionette/atom.js:104:505
          #      # getElementText@chrome://remote/content/marionette/actors/MarionetteCommandsChild.jsm:332:17
          #      # receiveMessage@chrome://remote/content/marionette/actors/MarionetteCommandsChild.jsm:120:31
          sleep 1
          expect(page).to have_content('The email address or password you entered is incorrect. Please try again.')
        end
      end
    end
  end

  describe 'on Footer Navigation Bar' do
    context 'without page object' do
      before do
        visit('/')
      end

      it 'clicks Mobile button successfully' do
        click_link('Mobile')
        expect(page).to have_content('Meet people on the go.')
      end

      it 'clicks Company button successfully' do
        find('.footer_nav').find_link('Company').click
        expect(page).to have_content('Meeting the universal need for human connection.')
      end
    end

    context 'with page object' do
      before do
        visit('/')
        @footer = FooterNavigationBar.new
      end

      it 'clicks Mobile button successfully' do
        @footer.click_mobile
        expect(page).to have_content('Meet people on the go.')
      end

      it 'clicks Jobs button successfully' do
        @footer.click_jobs
        expect(page).to have_content('We Engineer Serendipity.')
      end

      it 'clicks Privacy button successfully' do
        @footer.click_privacy
        expect(page).to have_content('PRIVACY POLICY')
      end

      it 'clicks Terms button successfully' do
        @footer.click_terms
        expect(page).to have_content('Terms of Service')
      end

      it 'clicks Support button successfully' do
        @footer.click_support
        expect(page).to have_content('How do I contact hi5?')
      end
    end
  end
end
