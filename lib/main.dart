import 'package:counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocProvider(
          create: (_) => CounterCubit(),
          child: HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(builder: (context, state) {
          return Text("$state");
        }),
      ),
      floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              key: const Key('counterView_increment_floatingActionButton'),
              child: Icon(Icons.add),
              onPressed: () => context.bloc<CounterCubit>().increment(),
            ),
            const SizedBox(height: 8),
            FloatingActionButton(
              key: const Key('counterView_decrement_floatingActionButton'),
              child: Icon(Icons.remove),
              onPressed: () => context.bloc<CounterCubit>().decrement(),
            ),
          ]),
    );
  }
}
