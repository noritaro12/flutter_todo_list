import 'package:flutter/material.dart';

void main() {
  runApp(MyToDoApp());
}

class MyToDoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TodoListPage());
  }
}

class TodoListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoListPageState();
}

class TodoListPageState extends State<TodoListPage> {
  List<String> todoList = ["001"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('リスト一覧')),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(child: ListTile(title: Text(todoList[index])));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newListText = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return TodoAddPage();
          }));

          if (newListText != null) {
            setState(() {
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoAddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoAddPageState();
}

class TodoAddPageState extends State<TodoAddPage> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("input:${_text}"),
            TextField(
              onChanged: (String value1) {
                setState(() {
                  _text = value1;
                });
              },
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop(_text);
              },
              color: Colors.blueAccent,
              child: Text('リスト追加', style: TextStyle(color: Colors.white)),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('cancel'),
            )
          ],
        ),
      ),
    );
  }
}
