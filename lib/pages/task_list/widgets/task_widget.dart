import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/task_model.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key, required this.task, required this.color});
  final Task task;
  final Color color;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isCompletedTest = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: GestureDetector(
        onTap: () {
          setState(() {
            isCompletedTest = !isCompletedTest;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          decoration: BoxDecoration(
            color: isCompletedTest ? widget.color : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: .8),
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        widget.task.title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          decoration: isCompletedTest ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.task.subtitle,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                top: 10,
              ),
              child: Text(
                DateFormat.yMMMEd().format(widget.task.date),
                style: TextStyle(
                  fontSize: 12,
                  color: isCompletedTest ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
