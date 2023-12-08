/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'dart:async';

export 'src/streams_streamfilteringanderrorhandling_base.dart';

/*
Practice Question 3: Stream Filtering and Error Handling

Task:

Implement a function filterStreamWithErrorHandling that takes a Stream<int> 
and a filtering function (bool Function(int)). 
The function should filter elements based on the 
filtering function and handle any errors by logging them. 
Return a new Stream<int> with only the elements that pass the filter.
 */

Stream<int> filterStreamWithErrorHandling(
    Stream<int> input, bool Function(int) callback) async* {
  StreamController<int> controller = StreamController<int>();

  input.listen((event) {
    controller.add(event);
  }, onError: (Object error) {
    print("Error thrown while processing a stream chunk! Error: $error");
  }, onDone: () => controller.close(), cancelOnError: false);

  await for(var indivInput in controller.stream){
    if(callback(indivInput)){
      yield indivInput;
    }
  }
}
