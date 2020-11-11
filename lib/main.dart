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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('リスト一覧')),
      body: ListView(
        children: [
          Card(child:  ListTile(title: Text('ニシンを買う'))),
          Card(child:  ListTile(title: Text('ニシンを買う'))),
          Card(child:  ListTile(title: Text('ニシンを買う'))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return TodoAddPage();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoAddPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('リスト追加'),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(),
            RaisedButton(
                onPressed: (){},
                color: Colors.blueAccent,
              child: Text('リスト追加',style: TextStyle(color: Colors.white)),
            ),
            FlatButton(
              onPressed: (){Navigator.of(context).pop();},
            child: Text('cancel'),
            )

          ],



        ),
      ),
    );

    // TODO: implement build
    throw UnimplementedError();
  }
}