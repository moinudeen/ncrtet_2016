$(window).scroll(function() {
  if ($(document).scrollTop() > 50) {
    $('header').addClass('navbar-fixed-top');
    $('#navHeader').removeClass('hidden');
  } else {
    $('header').removeClass('navbar-fixed-top');
    $('#navHeader').addClass('hidden');
  }
});

updateStaff = function(){
  var staff = document.getElementById('staffs');
  var students = document.getElementById('students');
  console.log(staff.value);
  document.getElementById('sta').innerHTML = "Rs. "+ parseInt(staff.value) * 1500 + "";
  document.getElementById('total').innerHTML = "Rs. "+ ((parseInt(staff.value) * 1500)+(parseInt(students.value) * 1000))  + "";
}

updateStud = function(){
  var staff = document.getElementById('staffs');
  var students = document.getElementById('students');
  console.log(staff.value);
  document.getElementById('stud').innerHTML = "Rs. "+ parseInt(students.value) * 1000 + "";
  document.getElementById('total').innerHTML = "Rs. "+ ((parseInt(staff.value) * 1500)+(parseInt(students.value) * 1000))  + "";
}
