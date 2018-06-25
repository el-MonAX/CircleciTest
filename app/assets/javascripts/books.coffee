# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  content = $('p.lead.small.line-height-2').html()
  $('p.lead.small.line-height-2').each ->
    if content.length > 470
      shortContent = content.substr(0, 470) + "..."
      $(this).html shortContent + "<a class='in-gold-500 ml-10' id='read_more' href=''>Read More<a/>"

  $('#read_more').click ->
    $('p.lead.small.line-height-2').each ->
      $(this).html content
      $('#read_more').hide()
    false

$(document).on 'turbolinks:load', ->
  $('.fa-minus').parent('#minus').click (event) ->
    event.preventDefault()
    input_el = $(this).siblings('.quantity-input')
    quantity = +input_el.val()
    if quantity > 1
      input_el.val(quantity - 1)

  $('.fa-plus').parent('#plus').click (event) ->
    event.preventDefault()
    input_el = $(this).siblings('.quantity-input')
    quantity = +input_el.val()
    input_el.val(quantity + 1)
