import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyHomePageStateをビルド');
    return ChangeNotifierProvider(
      create: (context) => MyHomePageState(),
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

class MyHomePageState extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void reBuild() {
    notifyListeners();
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
    final Function increment = context.read<MyHomePageState>().increment;
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
// flutter: WidgetBをビルド
// flutter: WidgetBをビルド
// flutter: WidgetBをビルド

// Providerについて
// ・ViewとロジックとStateを切り分けることができている
//
// ・final int counter = context.watch<MyHomePageState>().counter;
// ・final Function increment = context.read<MyHomePageState>().increment;
// final int counter = context.select<MyHomePageState, int>((state) => state.counter);

// watch
// ・状態に管理しているStateを取得できる
// ・常に再描画される（状態が変化したり、してない時でも再描画される。）
//
// read
// ・再描画されない。
// ・Functionとかに入れるといい！！

// select・
// ・状態が変化した時だけリビルドする
// ・無駄な描画が抑制されるから結構をおすすめ

//デメリット
// ・ChangeNofiterProviderの配下にいるWidgetたちからでしかStateにアクセスできない。
// ・State、ロジック、Viewの３つを切り分けられていない