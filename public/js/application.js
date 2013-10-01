$(document).ready(function() {
  $('form').submit(function(event){
    event.preventDefault();
    $('img').show()
    var data = $('form').serialize()
    $.post('/',data,function(response) {
      $('form').after(response)
      $('input').val('')
      $('img').hide()
    })
    
  })

});
