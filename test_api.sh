#!/bin/bash


curl -X "POST" "http://localhost:8080/graphql" \
     -H "Content-Type: application/graphql" \
     -d $'
mutation {
  widgetCreate(widget: {
    name:"AATestWidget",
    description:"AATestWidget Description"
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

curl -X "POST" "http://localhost:8080/graphql" \
     -H "Content-Type: application/graphql" \
     -d $'
mutation {
  widgetCreate(widget: {
    name:"BBTestWidget",
    description:"BBTestWidget Description"
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
  widgetQuery(name:"AA%", max:100) {
    totalCount
    results {
      id
      name
      description
    }
  }
}'

