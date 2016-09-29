// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require jquery-ui

$(document).ready(function() {
	// alert('hi');
	
	$("#slider1").change(function() {                    
   		var newValue = $('#slider1').val();
   		$("#price-tag").html(newValue);
	});

	$('.datepicker').datepicker({
		format: 'mm/dd/yyyy'
 	});	

 	$('.datepicker').change(function() {
 		var price = $('#total-price').data('price')
 		var start_date = Date.parse($('#start-date').val());
 		var end_date = Date.parse($('#end-date').val());
 		var total_price = ((end_date - start_date)/(1000*60*60*24)) * price;
 		$('#total-price').text('$' + total_price);

 	})

 	$(".btn-pref .btn").click(function () {
    	$(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
    	// $(".tab").addClass("active"); // instead of this do the below 
    	$(this).removeClass("btn-default").addClass("btn-primary");   
	});

});
