# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#language1').change ->
    language =  $('#language1').val()
    $('#language').val(language)
    $('#spinner').removeClass("hide")
    $('#postsDiv').empty()
    $.ajax({
      url: "/home/more_tweets",
      data: {language: language}
    }).done (rs) ->
      $('#spinner').addClass("hide")
      $('#postsDiv').append(rs).fadeIn('slow')

  $(window).on "scroll", ->
    lang = $("#language1").value
    if $(window).scrollTop() is ($(document).height() - $(window).height())
      $("#spinner").removeClass "hide"
      #Get older posts
      $.ajax
        type: "get"
        url: '/home/more_tweets'
        data:
          language: lang
        success: (oldposts) ->
          #Append #postsDiv
          $("#spinner").addClass "hide"
          $("#postsDiv").append(oldposts).fadeIn "slow"
