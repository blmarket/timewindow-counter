timewindow-counter
==================

Simple counter with time-window expiration nature

## Usage

    var TimeWindow = require('timewindow-counter').TimeWindow;
    
    var tt = new TimeWindow(1000); // Time Window is 1 second(default is 5 min)
    
    tt.add("key", 1); // expected value : 1
    tt.add("key", 2); // expected : 3
    setTimeout(function() { tt.add("key", 5); }, 1024); // expected value : 5, not 8

## API Reference

above example contains all of our APIs, nothing more!

see litcoffee script in lib directory to detailed documentation.

and I will make fancy document generator from that source
