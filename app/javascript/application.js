// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "@popperjs/core"

import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails"
// import Rails from "@rails/ujs"

// Rails.start()
Turbo.start()
