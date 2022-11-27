---
tags: [ json, filter ]
---
# To pretty print the json:
echo '[[1,2], "string", {"a":2}, null]' | jq '.'

# To access the value at key "bar":
echo '{"foo": 123, "bar": 456, "baz": 789}' | jq '.bar'

# To access first list item:
echo '[1,2,3,4,5]' | jq '.[0]'

# to slice and dice:
echo '[1,2,3,4,5]' | jq '.[2:4]'
echo '[1,2,3,4,5]' | jq '.[:4]'
echo '[1,2,3,4,5]' | jq '.[2:]'

# to extract all keys from json:
echo '{"foo": 123, "bar": 456, "baz": 789}' | jq 'keys'

# XX to sort by a key:
jq '.foo | sort_by(.bar)'

# to count elements:
echo '[[1,2], "string", {"a":2}, null]' | jq '.[] | length'
echo '[[1,2], "string", {"a":2}, null]' | jq 'map(length)'
echo '[[1,2], "string", {"a":2}, null]' | jq 'length'
echo '[[1,2], "string", {"a":2}, null]' | jq '. | length'

# print selected fields as text instead of json:
echo '{"foo": 123, "bar": 456, "baz": 789}' | jq '{foo, bar} | join(":")'

# apply a operation for each items
echo '[1,2,3,4,5]' | jq 'map(.+1)'
echo '[[1,2], "string", {"a":2}, null]' | jq 'map(length)'

# only print records where given field matches a value
echo '[1,5,3,0,7]' | jq 'map(select(. >= 2))'
echo '[1,5,3,0,7]' | jq '.[] | select(. >= 2)'

# if-else
echo 2 | jq 'if . == 0 then "zero" elif . == 1 then "one" else "many" end'

# query a json multiple times:
echo '{"foo": 123, "bar": 456, "baz": 789}' | jq '.foo, .bar'
