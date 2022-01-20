import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<Increment>((event, emit) => emit(CounterState(state.value + 1)));
    on<Decrement>((event, emit) => emit(CounterState(state.value - 1)));
  }
}

/* 
enum CounterEvent { Increment, Decrement }

class CounterBloc {
  int counter = 0;

  StreamController<CounterEvent> _eventController =
      StreamController<CounterEvent>();
  StreamSink get eventSink => _eventController.sink;

  StreamController<int> _counterController = StreamController<int>();
  StreamSink<int> get _counterSink => _counterController.sink;
  Stream<int> get counterStream => _counterController.stream;

  CounterBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event == CounterEvent.Increment) {
      counter++;
    } else {
      counter--;
    }

    _counterSink.add(counter);
  }

  void dispose() {
    _eventController.close();
    _counterController.close();
  }
}
 */