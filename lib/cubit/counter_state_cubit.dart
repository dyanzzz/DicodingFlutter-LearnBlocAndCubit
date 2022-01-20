part of 'counter_cubit.dart';

class CounterStateCubit extends Equatable {
  int value = 0;

  CounterStateCubit(this.value);

  @override
  List<Object> get props => [value];
}
