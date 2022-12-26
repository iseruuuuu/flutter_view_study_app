import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study_app/screen/5_provider_state_notifer/my_home_page.dart';
import 'package:riverpod_study_app/screen/5_provider_state_notifer/my_home_view_model.dart';
import 'package:riverpod_study_app/screen/5_provider_state_notifer/my_home_state.dart';

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

final myHomePageProvider =
    StateNotifierProvider<MyHomePageStateNotifier, MyHomePageState>(
  (ref) => MyHomePageStateNotifier(),
);
