function searchBar() {

  $("#search").on("keypress", function (e) {
    if (e.keyCode == 13) {
      return false;
    }
  });

  $("#search").on("keyup", function() {
    var filter = $(this).val();
    var $links = $(".links")
    $.each($links, function(){
      if ($(this).find('td').first().text().search(new RegExp(filter, "i")) === -1) {
        $(this).addClass("hidden")
      }
      else {
        $(this).removeClass("hidden")
      }
    })
  })
}
