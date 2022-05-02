import 'package:flutter/material.dart';

int x = 0;
void main() {
  runApp(const MaterialApp(
    title: "TODO APP",
    home: TODOAPP(),
  ));
}

class TODOAPP extends StatefulWidget {
  const TODOAPP({Key? key}) : super(key: key);

  @override
  State<TODOAPP> createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODOAPP> {
  String value = '';

  var listTODO = ['', 'HELLO'];
  addToDO(String item) {
    setState(() {
      listTODO.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TODO APP$x"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              addToDO(value);
            }),
        body: ListView.builder(
            itemCount: listTODO.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? Padding( 
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration: const InputDecoration(hintText: "Add Item"),
                        onChanged: (val) {
                          setState(() {
                            value = val;
                          });
                        },
                      ),
                    )
                  : ListTile(
                      leading: const Icon(Icons.work),
                      trailing: const Icon(Icons.delete),
                      title: Text(listTODO[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    );
            }));
  }
}
