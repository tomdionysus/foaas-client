class App.LinkView extends Mozart.View
  tag: 'a'
  skipTemplate: true

  init: ->
    super
    @bind 'change:content', @redoLink

  redoLink: =>
    @element?.attr 'href', @prefix+@content
    @element?.html @prefix+@content

