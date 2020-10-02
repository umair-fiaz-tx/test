# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".customclass").on "ajax:success", (event) ->
    console.log(($('tr#'+event.currentTarget.id)));
    $('tr#'+event.currentTarget.id).remove();
    alert "The article was deleted.";


$.ajax(url: "/articles").done (html) ->
  $("#results").append html
