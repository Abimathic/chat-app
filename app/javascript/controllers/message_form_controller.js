import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="message-form"

export default class extends Controller {
  static targets = ["input", "submit"]

  connect() {
    console.log("Stimulus connected")
    this.toggleButton()  // Check on page load
  }

  onInput() {
    this.toggleButton()  // Run every time input changes
  }

  toggleButton() {
    this.submitTarget.disabled = this.inputTarget.value.trim() === ""
  }
}