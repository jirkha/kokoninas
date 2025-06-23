# Pin npm packages by running ./bin/importmap
# This file is used to manage JavaScript imports for the Rails app.
# The lines below make sure Turbo and other JavaScript modules are available in the browser.
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
