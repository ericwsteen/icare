#= require jquery
#= require jquery-ui
#= require jquery_ujs
#= require tether
#= require bootstrap-sprockets
#= require turbolinks
#= require main
#= require_tree .

class @App.DynamicFields
  constructor: ->
    @addFields()
    @removeFields()

  addFields: ->
    $('form').on 'click', '.add_fields', (event) ->
      time = new Date().getTime()
      regexp = new RegExp($(@).data('id'), 'g')
      $(@).before($(@).data('fields').replace(regexp, time))
      event.preventDefault()

  removeFields: ->
    $('form').on 'click', '.remove_fields', (event) ->
      $(@).prev('input[type=hidden]').val('1')
      $(@).closest('.partial').remove()
      event.preventDefault()
