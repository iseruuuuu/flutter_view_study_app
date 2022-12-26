import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyHomePageStateをビルド');
    return ProviderScope(
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

class WidgetB extends ConsumerWidget {
  const WidgetB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(myHomePageProvider).counter;
    print('WidgetBをビルド');
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class WidgetC extends ConsumerWidget {
  const WidgetC({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('WidgetCをビルド');
    final Function increment = ref.read(myHomePageProvider.notifier).increment;
    return ElevatedButton(
      onPressed: () {
        increment();
      },
      child: const Text('カウント'),
    );
  }
}

// flutter: MyHomePageStateをビルド
// flutter: WidgetCをビルド
// flutter: WidgetBをビルド
// flutter: WidgetAをビルド
// flutter: WidgetBをビルド
// flutter: WidgetBをビルド
// flutter: WidgetBをビルド

// Provider + StateNofiter
// ・State、ViewModel、Viewの３つを切り分けられている
// ・アクセスするのはまだやりずらい。
