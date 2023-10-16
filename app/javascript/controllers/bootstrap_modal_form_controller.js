import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bootstrap-modal-form"
export default class extends Controller {
  connect() {
    console.log("I am connected!!!!");
  }

  initialize() {
    this.element.setAttribute('data-action', "click->bootstrap-modal-form#showModal");
  }

  showModal(event) {
    event.preventDefault();

    this.url = this.element.getAttribute('href');

    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}
