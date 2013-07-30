# These are example model relationships and can be removed.

App.Operation.hasMany App.Opfield, 'opfields'

App.Opfield.belongsTo App.Operation, 'operation'