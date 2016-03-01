function unreadFilter() {

  $("#unreadToggle").on("click", function () {

    var $links = $(".links")
    $.each($links, function(){
      if ($(this).children().text().indexOf("Mark as Unread") > -1) {
        $(this).addClass("hidden")
      }
      else {
        $(this).removeClass("hidden")
      }
    })
  })
}
