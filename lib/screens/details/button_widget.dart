import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/model/model.dart';
import 'package:student_app_provider/provider/details_page_provider.dart';
import 'package:student_app_provider/screens/edit/strudent_edit.dart';
import 'package:student_app_provider/widgets/delete_dialoge.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.student,
  });

  final Student student;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 300,
          height: 60,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  //  topRight: Radius.circular(60),
                  bottomRight: Radius.circular(60)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(156, 0, 0, 0),
                  blurRadius: 20,
                  offset: Offset(10, 0),
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
     Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditStudent(student: student),
                ),
              ).then((_) => Navigator.pop(context));
                },
                label: const Text(
                  'EDIT',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  _deleteDialog(context);
                },
                label: const Text(
                  'DELETE',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Future<void> _deleteDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => DeleteDialoge(
        onCancel: () {
          Navigator.pop(context);
        },
        onDelete: () {
          Provider.of<StudentDetailProvider>(context, listen: false)
              .deleteStudent(student.id);
          void popUntilHomeScreen(BuildContext context) {
            Navigator.popUntil(context, (route) => route.isFirst);
          }

          popUntilHomeScreen(context);
        },
      ),
    );
  }
}
