#!/bin/bash


curl -X "POST" "http://localhost:8080/graphql" \
     -H "Content-Type: application/graphql" \
     -d $'
mutation {
  widgetCreate(widget: {
    name:"TestWidget",
    description:"TestWidget"
  }) {
    id
    name
    description
    errors {
      field
      message
    }
  }
}
'

echo Search refdata

curl -X "POST" "http://localhost:8080/graphql" \
     -H "Content-Type: application/graphql" \
     -d $'
{
  widgetList(max: 100) {
    id
    name
    description
    errors {
      field
      message
    }
  }
}'

echo Test custom query

curl -X "POST" "http://localhost:8080/graphql" \
     -H "Content-Type: application/graphql" \
     -d $'
{
  widgetQuery(name:"Test%", max:100) {
    totalCount
    results {
      id
      name
      description
    }
  }
}'

