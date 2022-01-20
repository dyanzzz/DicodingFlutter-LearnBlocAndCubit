import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state_cubit.dart';

class CounterCubit extends Cubit<CounterStateCubit> {
  CounterCubit() : super(CounterStateCubit(0));

  void increment() {
    emit(CounterStateCubit(state.value + 1));
  }

  void decrement() {
    emit(CounterStateCubit(state.value - 1));
  }
}
