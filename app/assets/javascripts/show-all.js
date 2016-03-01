function showAll() {

  $("#showAllToggle").on("click", function () {

    var $links = $(".links")
    $.each($links, function(){

        $(this).removeClass("hidden")
      })
    })
}
