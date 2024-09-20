import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Task {
  String name;
  bool isCompleted;

  Task(this.name, this.isCompleted);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> tasks = [];  // タスクを管理するリスト

  // タスクを追加するメソッド
  void _addTask(String taskName) {
    setState(() {
      tasks.add(Task(taskName, false));  // 新しいタスクを未完了状態で追加
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('flutterのタスク管理ツール'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  // タスク追加用の入力フィールド
                  child: TextField(
                    onSubmitted: (text) {
                      _addTask(text);  // 入力されたテキストで新しいタスクを追加
                    },
                    decoration: InputDecoration(
                      labelText: '新しいタスクを追加',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
