class FooterNavigationBar
  include Capybara::DSL

  def click_mobile
    menu_container.click_link 'Mobile'
  end

  def click_company
    menu_container.click_link 'Company'
  end

  private

  def menu_container
    css_selector = '.footer_nav'
    if block_given?
      within css_selector do
        yield
      end
    else
      find (css_selector)
    end
  end
end
