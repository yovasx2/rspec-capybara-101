# frozen_string_literal: true

class FooterNavigationBar
  include Capybara::DSL

  def click_mobile
    menu_container.click_link 'Mobile'
  end

  def click_company
    menu_container.click_link 'Company'
  end

  def click_jobs
    menu_container.click_link 'Jobs'
  end

  def click_privacy
    menu_container.click_link 'Privacy'
  end

  def click_terms
    menu_container.click_link 'Terms'
  end

  def click_report_abuse
    menu_container.click_link 'Report Abuse'
  end

  def click_support
    menu_container.click_link 'Support'
  end

  private

  def menu_container(&block)
    css_selector = '.footer_nav'
    if block_given?
      within css_selector, &block
    else
      find(css_selector)
    end
  end
end
