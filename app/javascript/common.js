$(document).on('turbolinks:load', function () {
  $(function () {

    // Hamburger Menu
    $('.hamburger').click(function () {
      $(this).toggleClass('active');

      if ($(this).hasClass('active')) {
        $('.globalMenuSp').addClass('active');
      } else {
        $('.globalMenuSp').removeClass('active');
      }
    });

    // Header fixed
    var height = $("#header").height();
    $("body").css("margin-top", height);

  });
})
