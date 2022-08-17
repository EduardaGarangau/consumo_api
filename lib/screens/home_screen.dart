import 'package:consumo_api/models/todo_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TodoProvider>(context, listen: false).getAllRepHttp();
  }

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoProvider>(context).todoList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumo de API'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(
              top: 15,
              left: 6,
              right: 6,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        todoList[index].title,
                        style: TextStyle(
                          decoration: todoList[index].completed
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: 1.1,
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        checkColor: Colors.white,
                        value: todoList[index].completed,
                        onChanged: (bool? value) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
