// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require popper.js
//= require select2.js
//= require bootstrap.js
//= require rails-ujs
//= require bootstrap-sprockets
//= require bxslider
//= require_tree .



$(document).ready(function(){
  $('.bxslider').bxSlider();
});

function editComment(x){
  $('#edit-each-comment-'+x).css("display","block");
}

function myFunction(x) {
  x.classList.toggle("far fa-thumbs-up");
}

function preview_profile_image(event) 
{
 var reader = new FileReader();
 reader.onload = function()
 {
  var output = document.getElementById('output_profile_image');
  output.src = reader.result;
 }
 reader.readAsDataURL(event.target.files[0]);
}


function preview_cover_image(event) 
{
 var reader = new FileReader();
 reader.onload = function()
 {
  var output = document.getElementById('output_cover_image');
  output.src = reader.result;
 }
 reader.readAsDataURL(event.target.files[0]);
}
$('#user-search').change(function() {
  alert('test');
});















