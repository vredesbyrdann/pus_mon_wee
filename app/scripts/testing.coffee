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
    age: "23"

  log testObject
  (->
    runTest = ->
      if not paused and queue.length
        queue.shift()()
        resume() unless paused
      return
    queue = []
    paused = false
    results = undefined
    @test = (name, fn) ->
      queue.push ->
        results = document.getElementById("results")
        results = assert(true, name).appendChild(document.createElement("ul"))
        fn()
        return

      runTest()
      return

    @pause = ->
      paused = true
      return

    @resume = ->
      paused = false
      setTimeout runTest, 1
      return

    @assert = assert = (value, desc) ->
      li = document.createElement("li")
      li.className = (if value then "pass" else "fail")
      li.appendChild document.createTextNode(desc)
      results.appendChild li
      li.parentNode.parentNode.className = "fail"  unless value
      li

    return
  )()
  window.onload = ->
    test "Async Test #1...", ->
      pause()
      setTimeout (->
        assert true, "First test..."
        return
      ), 1000
      return

    return

  return
)()
