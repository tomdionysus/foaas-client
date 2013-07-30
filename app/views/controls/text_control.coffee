class App.TextControl extends Mozart.Control
  tag: "input"
  skipTemplate: true

  init: ->
    super
    @bind 'change:value', @updateInputValue
      
  afterRender: =>
    @element.type = @typeHtml if @typeHtml?
    @updateInputValue()
    @element

  updateInputValue: =>
    return unless @element?
    @element.val(@value)

  focus: ->
    return unless @element?
    @element.focus()

  blur: ->
    return unless @element?
    @element.blur()
    
  keyUp: (e) ->
    @set 'value', @element.val()

class App.IndexWriteTextControl extends App.TextControl

  updateInputValue: =>
    return unless @element? and @value?
    @element.val(@value[@index])
    
  keyUp: (e) =>
    return unless @value?
    @value.set(@index,@element.val())