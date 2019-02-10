require 'rubygems'
require 'bundler/setup'

require 'watir'

BTN_CLASS = 'contribution-activity-show-more'

FILE = "page.html"

def download_page
  b = Watir::Browser.new(:firefox)

  begin
    b.goto("http://github.com/westonganger")

    btn = b.button(class: BTN_CLASS)
    while btn
      btn.click

      IO.write(FILE, b.html)

      sleep 2 ### try not to get throttled from Github

      if b.element(class: BTN_CLASS).present?
        btn = b.button(class: BTN_CLASS)
      else
        btn = nil
      end
    end

    #issue_links.concat b.elements(class: 'execute').map(&:href)

    b.quit
  rescue Exception => e
    puts e.message

    b.quit
  end
end

def parse_page
  
end

download_page
parse_page
