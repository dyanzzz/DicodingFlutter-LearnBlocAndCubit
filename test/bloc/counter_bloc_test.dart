import 'package:bloc_test/bloc_test.dart';
import 'package:dicoding_counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CounterBloc counterBloc;

  setUp(() {
    counterBloc = CounterBloc();
  });

  test("initialstate should be counterstate(0)", () {
    expect(counterBloc.state, CounterState(0));
  });

  blocTest<CounterBloc, CounterState>(
    'should emits CounterState(1) when increment Event is added.',
    build: () => counterBloc,
    act: (bloc) => bloc.add(Increment()),
    expect: () => [
      CounterState(1),
    ],
  );

  blocTest<CounterBloc, CounterState>(
    'should emits CounterState(-1) when decrement is added.',
    build: () => counterBloc,
    act: (bloc) => bloc.add(Decrement()),
    expect: () => [
      CounterState(-1),
    ],
  );
}
