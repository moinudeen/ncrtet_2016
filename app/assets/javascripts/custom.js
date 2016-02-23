$(window).scroll(function() {
  if ($(document).scrollTop() > 50) {
    $('header').addClass('navbar-fixed-top');
    $('#navHeader').removeClass('hidden');
  } else {
    $('header').removeClass('navbar-fixed-top');
    $('#navHeader').addClass('hidden');
  }
});
