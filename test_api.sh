#!/bin/bash

# echo -e "\n\nTry with variables -- can't get this working at the moment"
#
# curl -X "POST" "http://localhost:8080/graphql" \
#      -H "Content-Type: application/json" \
#      -d $'{
#   "query" : "mutation { widgetCreate(widget: $vw) { id name description errors { field message } } }",
#   "variables": {
#     "vw" : { "name": "AATestWidget", "description": "AATestWidget Description" }
#   }
# }
# '



echo -e "\n\nTry to send well formed JSON as the mutation parameter"

curl -X "POST" "http://localhost:8080/graphql" \
     -H "Content-Type: application/graphql" \
     -d $'
mutation {
  widgetCreate(widget: {
    "name": "AATestWidget",
    "description": "AATestWidget Description"
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


echo -e "\n\nWorking version"

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


echo -e "\n\nList widgets"

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

echo -e "\n\nTest custom query"

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

