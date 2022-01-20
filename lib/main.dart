import 'package:dicoding_counter_bloc/bloc/counter_bloc.dart';
import 'package:dicoding_counter_bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      /* home: BlocProvider<CounterBloc>(
        create: (_) => CounterBloc(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ), */
      home: BlocProvider<CounterCubit>(
        create: (_) => CounterCubit(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterCubit, CounterStateCubit>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${state.value}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        },
      ),
      /* body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${state.value}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        },
      ), */
      /* body: StreamBuilder(
        stream: counterBloc.counterStream,
        builder: (context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        },
      ), */
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            //onPressed: () => counterBloc.eventSink.add(CounterEvent.Decrement),
            //onPressed: () => context.read<CounterBloc>().add(Decrement()),
            onPressed: () => context.read<CounterCubit>().decrement(),
            tooltip: "Decrement",
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            //onPressed: () => counterBloc.eventSink.add(CounterEvent.Increment),
            //onPressed: () => context.read<CounterBloc>().add(Increment()),
            onPressed: () => context.read<CounterCubit>().increment(),
            tooltip: "Increment",
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    //counterBloc.dispose();
    super.dispose();
  }
}
