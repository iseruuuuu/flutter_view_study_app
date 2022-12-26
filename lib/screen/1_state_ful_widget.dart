import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('MyHomePageStateをビルド');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const WidgetA(),
            WidgetB(counter: _counter),
            WidgetC(increment: _incrementCounter),
          ],
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
    required this.counter,
  }) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    print('WidgetBをビルド');
    return Column(
      children: [
        Text(
          '$counter',
          style: Theme.of(context).textTheme.headline4,
        ),
        WidgetD(counter: counter),
      ],
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({
    Key? key,
    required this.increment,
  }) : super(key: key);

  final Function increment;

  @override
  Widget build(BuildContext context) {
    print('WidgetCをビルド');
    return ElevatedButton(
      onPressed: () {
        increment();
      },
      child: const Text('カウント'),
    );
  }
}

class WidgetD extends StatelessWidget {
  const WidgetD({Key? key,required this.counter,}) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



// flutter: MyHomePageStateをビルド
// flutter: WidgetAをビルド
// flutter: WidgetBをビルド
// flutter: WidgetCをビルド
// flutter: MyHomePageStateをビルド
// flutter: WidgetBをビルド
// flutter: WidgetCをビルド
// flutter: WidgetAをビルド

//TODO　本来だったら数字だけ（WidgetB）だけをビルドしたい！！
// flutter: MyHomePageStateをビルド
// flutter: WidgetBをビルド
// flutter: WidgetCをビルド


//TODO StateFulWidgetについて
// ・シンプルで書きやすい
// ・複雑な画面構成になると情報のやり取り（状態）がしづらくなる

