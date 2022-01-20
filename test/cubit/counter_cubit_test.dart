import 'package:bloc_test/bloc_test.dart';
import 'package:dicoding_counter_bloc/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CounterCubit counterCubit;

  setUp(() {
    counterCubit = CounterCubit();
  });

  test("initialstate should be counterstate(0)", () {
    expect(counterCubit.state, CounterStateCubit(0));
  });

  blocTest<CounterCubit, CounterStateCubit>(
    'should emits CounterState(1) when increment Event is added.',
    build: () => counterCubit,
    act: (cubit) => cubit.increment(),
    expect: () => [
      CounterStateCubit(1),
    ],
  );

  blocTest<CounterCubit, CounterStateCubit>(
    'should emits CounterState(-1) when decrement is added.',
    build: () => counterCubit,
    act: (cubit) => cubit.decrement(),
    expect: () => [
      CounterStateCubit(-1),
    ],
  );
}
