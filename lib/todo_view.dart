import 'package:flutter/material.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  List<String> task = [];
  TextEditingController taskController = TextEditingController();

  @override
  void dispose() {
    taskController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                controller: taskController,
                decoration: InputDecoration(
                  labelText: 'Nhập tên công việc của Huyền My',
                )),
          ),
          ElevatedButton(
            onPressed: addTask,
            child: Text('Thêm công việc'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(task.elementAt(index)),
                  trailing: IconButton(
                    onPressed: () {
                      task.removeAt(index);
                      setState(() {});
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void addTask() {
    if (taskController.text.isNotEmpty) {
      debugPrint('Không đc để trống');

      setState(() {
        //kiểm tra khi thêm task
        task.add(taskController.text);
        debugPrint(task.length.toString());
        taskController.clear();
      });
    }
  }
}
