class App.SelectControl extends Mozart.Control
  tag: 'select'
  skipTemplate: true
  idField: 'id'
  valueField: 'name'

  init: ->
    super
    @bind 'change:value', @updateValue
    @bind 'change:collection', @redraw

  afterRender: =>
    @element.empty()
    for value in @collection.all()
      ele = $('<option>').attr('value',value[@idField]).html(value[@valueField])
      @element.append(ele)
    @updateValue()

  updateValue: =>
    return unless @element?
    @element.val(@value[@idField])

  setValue: =>
    return unless @element?
    @set 'value', @collection.findByAttribute(@idField,@element.val())[0]

  change: ->
    @setValue()
