import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app_provider/core/colors.dart';
import 'package:student_app_provider/model/model.dart';
import 'package:student_app_provider/screens/details/button_widget.dart';
import 'package:student_app_provider/screens/details/image_Widget.dart';
import 'package:student_app_provider/widgets/widget.dart';

class StudentDetails extends StatelessWidget {
  final Student student;
 const StudentDetails({super.key, required this.student});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("STUDENT DETAILS"),
        titleTextStyle: titleStyle,
        backgroundColor: color1,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: maincolor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                khight,
                ImageWidget(student: student),
                khight1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 320,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(156, 0, 0, 0),
                            blurRadius: 20,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name: ${student.name}",
                              style: styledetails(),
                            ),
                            Text(
                              "School: ${student.school}",
                              style: styledetails(),
                            ),
                            Text(
                              "Age: ${student.age}",
                              style: styledetails(),
                            ),
                            Text(
                              "Phone: ${student.phone}",
                              style: styledetails(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                khight1,
                ButtonWidget(student: student),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle styledetails() => GoogleFonts.crimsonPro(
        fontSize: 26,
        color: Colors.blueGrey.shade500,
        fontWeight: FontWeight.w600,
      );
}
