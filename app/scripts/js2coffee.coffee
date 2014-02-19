(->
  log = ->
    try
      console.log.apply console, arguments_
    catch e
      try
        opera.postError.apply opera, arguments_
      catch e
        alert Array::join.call(arguments_, " ")
    return
  testObject = undefined
  testObject =
    name: "Awesome..."
    age: "23"

  log testObject
  return
)()
