const key_paragraph = document.querySelector('#key');
const long_url_paragraph = document.querySelector("#long_url");

fetch(key_paragraph.innerText, { method: "POST" })
    .then((res) => {
        return res.json()
    })
    .then(() =>  window.location.replace(long_url_paragraph.innerText))