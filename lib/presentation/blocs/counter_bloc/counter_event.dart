part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();

  /* @override
  List<Object> get props => []; */
}

class CounterIncreased extends CounterEvent {
  final int value;

  CounterIncreased(this.value);
}

class CounterReset extends CounterEvent {
  /* final int value;

  CounterReset(this.value); */
}
