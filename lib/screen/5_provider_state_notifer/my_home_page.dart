import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:riverpod_study_app/screen/5_provider_state_notifer/my_home_view_model.dart';

import 'my_home_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyHomePageStateをビルド');
    return StateNotifierProvider<MyHomePageStateNotifier, MyHomePageState>(
      create: (context) => MyHomePageStateNotifier(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              WidgetA(),
              WidgetB(),
              WidgetC(),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('WidgetAをビルド');
    return const Text(
      'You have pushed the button this many times:',
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('WidgetBをビルド');
    // final int counter = context.watch<MyHomePageState>().counter;
    final int counter =
        context.select<MyHomePageState, int>((state) => state.counter);
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('WidgetCをビルド');
    final Function increment =
        context.read<MyHomePageStateNotifier>().increment;
    return ElevatedButton(
      onPressed: () {
        increment();
      },
      child: const Text('カウント'),
    );
  }
}

// flutter: MyHomePageStateをビルド
// flutter: WidgetAをビルド
// flutter: WidgetBをビルド
// flutter: WidgetCをビルド
// flutter: MyHomePageStateをビルド
// flutter: WidgetCをビルド
// flutter: WidgetBをビルド
// flutter: WidgetAをビルド
// flutter: WidgetBをビルド
// flutter: WidgetBをビルド


// RiverPod
//・色々なViewからロジックを持ってくることができる