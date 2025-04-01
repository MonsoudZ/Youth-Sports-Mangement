import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "password",
    "passwordConfirmation",
    "firstName",
    "lastName",
    "role",
    "submit",
    "firstNameError",
    "lastNameError",
    "passwordError",
    "passwordConfirmationError"
  ]
  static classes = ["valid", "invalid"]

  connect() {
    this.validateForm()
  }

  validatePassword() {
    const password = this.passwordTarget.value
    const isValid = password.length >= 8
    this.toggleFieldValidation(this.passwordTarget, isValid)
    this.passwordErrorTarget.textContent = isValid ? "" : "Password must be at least 8 characters"
    this.validateForm()
  }

  validatePasswordConfirmation() {
    const password = this.passwordTarget.value
    const confirmation = this.passwordConfirmationTarget.value
    const isValid = password === confirmation && confirmation.length >= 8
    this.toggleFieldValidation(this.passwordConfirmationTarget, isValid)
    this.passwordConfirmationErrorTarget.textContent = isValid ? "" : "Passwords do not match"
    this.validateForm()
  }

  validateName(event) {
    const field = event.target
    const errorTarget = field === this.firstNameTarget ? this.firstNameErrorTarget : this.lastNameErrorTarget
    const isValid = field.value.length >= 2
    this.toggleFieldValidation(field, isValid)
    errorTarget.textContent = isValid ? "" : "Name must be at least 2 characters"
    this.validateForm()
  }

  toggleFieldValidation(field, isValid) {
    if (isValid) {
      field.classList.add(this.validClass)
      field.classList.remove(this.invalidClass)
    } else {
      field.classList.add(this.invalidClass)
      field.classList.remove(this.validClass)
    }
  }

  validateForm() {
    const isValid = this.allFieldsValid()
    this.submitTarget.disabled = !isValid
  }

  allFieldsValid() {
    const firstName = this.firstNameTarget.value
    const lastName = this.lastNameTarget.value
    const password = this.passwordTarget.value
    const confirmation = this.passwordConfirmationTarget.value
    const role = this.roleTarget.value

    return (
      firstName.length >= 2 &&
      lastName.length >= 2 &&
      password.length >= 8 &&
      password === confirmation &&
      role
    )
  }
}