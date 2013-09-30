$(document).ready(function() {
  $('img').hide()
  $('form').submit(function(event){
    event.preventDefault();
    $('img').show()
    var data = $('form').serialize()
    $.post('/',data,function(response) {
      $('form').after(response)
      $('img').hide()
    })
    
  })

});
