import 'package:flutter/material.dart';
import 'package:flutter_application/model/todomodel.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<ToDoModel> tododata = [];

  final TextEditingController textEditingControllerTitle =
      TextEditingController();
  final TextEditingController textEditingControllerData =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: textEditingControllerTitle,
              decoration: const InputDecoration(
                hintText: "Add Title",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: textEditingControllerData,
              decoration: const InputDecoration(
                hintText: "Add Data",
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tododata.length,
              itemBuilder: (context, index) {
                var items = tododata[index];
                return ListTile(
                  title: Text(items.title),
                  subtitle: Text(items.data),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        tododata.remove(items);
                      });
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            var data = ToDoModel(textEditingControllerTitle.text,
                textEditingControllerData.text);
            tododata.add(data);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
