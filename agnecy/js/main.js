var headerMenu = document.querySelector(".header__drop"),
	headerLinks = document.querySelector(".header__nav-links");
headerMenu.addEventListener("click", function() {
	headerLinks.classList.toggle("is-show");
});

var employees = document.querySelectorAll(".employees__item"),
	selectedEmployee = document.querySelector(".employees__item.is-selected");

for(var i=0; i<employees.length; i++)
{
	employees[i].style['order'] = i * 2;

	employees[i].addEventListener("click", function() {
		for(var j=this.classList.length-1; j>-1; j--)
		{
			if(this.classList[j] === 'is-selected')
			{
				return;
			}
		}
		selectedEmployee.classList.toggle("is-selected");
		this.classList.toggle("is-selected");

		var order = this.style['order'];
		selectedEmployee.style['order'] = order;
		this.style['order'] = order - 1;

		if(document.documentElement.clientWidth > 910) 
		{
			coord = 'translate(-' + this.offsetLeft + 'px, -' + this.offsetTop + 'px)';
			this.querySelector(".employee__img").style['transform'] = coord;
			selectedEmployee.querySelector(".employee__img").style['transform'] = 'none';
		}
		else 
		{
			selectedEmployee.querySelector(".employee__img").style['transform'] = 'none';
		}

		selectedEmployee = this;
	});
}
 
window.addEventListener('resize', function(e){
	if(document.documentElement.clientWidth > 910) 
	{
		selectedEmployee.querySelector(".employee__img").style['transform'] = 'translate(-' + employees[0].offsetLeft + 'px, -' + employees[0].offsetTop + 'px)';
	}
	else 
	{
		selectedEmployee.querySelector(".employee__img").style['transform'] = 'none';
	}

});

document.addEventListener("DOMContentLoaded", function(e){
	if(document.documentElement.clientWidth > 910) 
	{
		selectedEmployee.querySelector(".employee__img").style['transform'] = 'translate(-' + employees[0].offsetLeft + 'px, -' + employees[0].offsetTop + 'px)';
	}
	else 
	{
		selectedEmployee.querySelector(".employee__img").style['transform'] = 'none';
	}
});