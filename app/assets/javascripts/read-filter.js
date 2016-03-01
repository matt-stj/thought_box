function readFilter() {

  $("#readToggle").on("click", function () {

    var $links = $(".links")
    $.each($links, function(){
      if ($(this).children().text().indexOf("Mark as Read") > -1) {
        $(this).addClass("hidden")
      }
      else {
        $(this).removeClass("hidden")
      }
    })
  })
}
