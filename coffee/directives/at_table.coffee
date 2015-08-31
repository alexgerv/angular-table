angular.module("angular-table").directive "atTable", ["$filter", ($filter) ->
  restrict: "AC"
  scope: true

  compile: (element, attributes, transclude) ->
    tc = new TableConfiguration(element, attributes)
    cvn = new configurationVariableNames(attributes.atConfig)
    table = new Table(element, tc, cvn, attributes.atConfig)
    table.compile()

    post: ($scope, $element, $attributes) ->
      table.post($scope, $element, $attributes, $filter)
]