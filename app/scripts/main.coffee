(->
  log = ->
    try
      console.log.apply console, arguments
    catch e
      try
        opera.postError.apply opera, arguments
      catch e
        alert Array::join.call(arguments, " ")
    return
  testObject = undefined
  testObject =
    name: "Awesome..."
    age: 23

  log testObject
  return
)()
