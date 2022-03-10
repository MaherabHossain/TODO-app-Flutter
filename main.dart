import 'package:flutter/material.dart';

void main() {
  return (runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var technology = [];
  var todo = TextEditingController();
  void addTodo() {
    setState(() {
      technology.add(todo.text);
      todo.text = '';
    });
  }

  void deleteTodo(index) {
    setState(() {
      technology.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'TODO APP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontStyle: FontStyle.italic,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                controller: todo,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 2),
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: addTodo,
              icon: Icon(Icons.add),
              label: Text(
                'Add Todo',
              ),
              style: ElevatedButton.styleFrom(primary: Colors.pink),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return (Card(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            technology[index],
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () {
                                  deleteTodo(index);
                                },
                              ))
                        ],
                      ),
                    ),
                  ));
                },
                itemCount: technology.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
