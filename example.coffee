{TimeWindow} = require './lib'

counter = new TimeWindow(1000)

counter.add 'key', 1, -> console.log arguments
counter.add 'key', 2, -> console.log arguments

setTimeout(
  ->
    counter.add 'key', 5, -> console.log arguments
  1024
)
