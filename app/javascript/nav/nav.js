const hamburger_button = document.querySelector("#hamburger_button");
function toggle_navbar() {
    hamburger_button.classList.toggle("bg-purple-custom1");
}
hamburger_button.addEventListener('click', () => toggle_navbar());