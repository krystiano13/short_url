const hamburger_button = document.querySelector("#hamburger_button");
const nav_menu = document.querySelector("#nav_menu");

function toggle_navbar() {
    hamburger_button.classList.toggle("bg-purple-custom1");
    nav_menu.classList.toggle("translate-y-[-100vh]");
}

hamburger_button.addEventListener('click', () => toggle_navbar());