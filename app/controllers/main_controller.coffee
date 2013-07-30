class App.MainController extends Mozart.Controller
  init: ->

    x = App.Operation.createFromValues({ name: 'off', url: '/off/:name/:from' }).opfields()
    x.createFromValues({name:'Name', field:'name'})
    x.createFromValues({name:'From', field:'from'})
    
    App.Operation.createFromValues({ name: 'you' })
    App.Operation.createFromValues({ name: 'donut' })

    @set 'operations', App.Operation
    @set 'current', App.Operation.findByAttribute('name','off')[0]
    @set 'fields', Mozart.MztObject.create()

    @set 'currentUrl', ""

    @bind 'change:current', @setupUrl
    @fields.bind 'change', @setupUrl


  getUrl: (url) =>
    for own k,v of @fields
      url = url.replace(":#{k}",v) 
    url

  setupUrl: =>
    @set 'currentUrl', @getUrl(@current.url)