Timewindow-Counter
------------------

Simple counter with time-window expiration

## Project properties

* Default time window is 5 min

    DEFAULT_WINDOW = 5 * 60 * 1000

## Class definition

    class TimeWindow
      constructor: (@window = DEFAULT_WINDOW) ->
        @window = Number(@window)
        @current_time = @cropTime()

My code uses in-memory storage to keep counters, but I will support redis and dynamo soon.

        @counters = {}

You can set timechange to get accumulated result of previous time window.

        @timechange = null

      cropTime: (time = (new Date).getTime()) ->
        time = Number(time)
        time - (time % @window)

      add: (key, value) ->
        span = @cropTime()
        if span != @current_time
          if @timechange?
            for k of @counters
              @timechange(null, @current_time, k, @counters[k])
          @counters = {}
          @current_time = span
        return unless value
        @counters[key] ?= 0
        return @counters[key] += value

## Testcases

This is for develop purpose only.(prepend do if you wanna try)

    ->
      tt = new TimeWindow(1024)
      tt.timechange = (err, k, v) ->
        console.log k, v
      setInterval(
        ->
          console.log tt.add("k", 123)
          console.log tt.add("k2", 1)
        50
      )

## Module exports

This module exports TimeWindow class to public.

    module.exports.TimeWindow = TimeWindow
