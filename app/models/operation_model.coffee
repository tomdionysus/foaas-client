App.Operation = Mozart.Model.create
  modelName: 'Operation'

App.Operation.attributes
  'name': 'string'
  'url': 'string'

App.Operation.index 'name'