# This model represents individual item returned after upload request.
@CSVItem = Backbone.Model.extend
    modelId: (attrs) ->
        attrs.id

# Collection of all items
@CSVItems = Backbone.Collection.extend
    model: CSVItem
