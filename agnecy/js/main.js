var headerMenu = document.querySelector(".header__drop"),
	headerLinks = document.querySelector(".header__nav-links");
headerMenu.addEventListener("click", function() {
	headerLinks.classList.toggle("is-show");
});
 
