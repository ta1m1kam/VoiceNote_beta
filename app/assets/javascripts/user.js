$(document).on('turbolinks:load', function(){
  $(document).on('keyup', '#form', function(e){
    e.preventDefault();
    var input = $.trim($(this).val());

    $.ajax({
      url: '/users/search',
      type: 'GET',
      data: ('keyword=' + input),
      processData: false,
      contentType: false,
      dataType: 'json'
    })

    .done(function(data){
      $('#result').find('a').remove();
      $('#result').find('br').remove();
      $(data).each(function(i, user){
        $('#result').append(`<a href="/users/${user.id}">` + user.name + `</a></br>`)
      });
    })
  });
});
