# frozen_string_literal: true

class TopNavigationBar
  include Capybara::DSL

  def do_login(username, password)
    # top_bar do
    within_frame(find('#login_frame')) do
      # byebug
      fill_in('username', with: username)
      fill_in('password', with: password)
      click_button('Sign In')
    end
    # end
  end

  private

  def top_bar(&block)
    css_selector = '.headercontent'
    if block_given?
      within css_selector, &block
    else
      find(css_selector)
    end
  end
end
