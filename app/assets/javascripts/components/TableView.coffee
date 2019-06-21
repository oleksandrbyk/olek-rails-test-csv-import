//= require './RowView.coffee'

###
  This collection view generates all rows using RowView as children
###
RowsView = Marionette.CollectionView.extend
  tagName: 'tbody'
  childView: RowView

###
  This view wraps the Table and any changes in collection will re-render the table.
###
@TableView = Marionette.View.extend
  tagName: 'table'
  className: 'table table-bordered'
  template: _.template '

    <thead>
      <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Errors</th>
        <th></th>
      </tr>
    </thead>

    <tbody></tbody>
  '
  regions:
    body:
      el: 'tbody'
      replaceElement: true

  collectionEvents:
    change: 'onRender'
    reset: 'onRender'

  onRender: ->
    (@getRegion 'body').show new RowsView
      collection: @collection
