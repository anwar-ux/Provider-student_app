import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/core/colors.dart';
import 'package:student_app_provider/database/database.dart';
import 'package:student_app_provider/model/model.dart';
import 'package:student_app_provider/provider/edit_page_provider.dart';
import 'package:student_app_provider/provider/home_page_provider.dart';
import 'package:student_app_provider/widgets/text_field.dart';
import 'package:student_app_provider/widgets/widget.dart';

// ignore: must_be_immutable
class EditStudent extends StatelessWidget {
  final Student student;
  EditStudent({super.key, required this.student});
  final formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _schoolnameController = TextEditingController();
  final _phonenameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final editStudentProvider = Provider.of<EditPageProvider>(context);
    _nameController.text = student.name;
    _schoolnameController.text = student.school;
    _phonenameController.text = student.phone.toString();
    _ageController.text = student.age.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("EDIT STUDENT"),
        centerTitle: true,
        titleTextStyle: titleStyle,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(35), child: SizedBox()),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: maincolor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () async {
                        final image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          editStudentProvider.setImage(image);
                        }
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: editStudentProvider.profileImgPath != null
                                ? FileImage(
                                    File(editStudentProvider.profileImgPath!))
                                : student.profileimg.isNotEmpty
                                    ? FileImage(File(student.profileimg))
                                    : const NetworkImage(
                                        "https://banner2.cleanpng.com/20180802/gyc/kisspng-computer-icons-shape-user-person-scalable-vector-g-imag-icons-3-617-free-vector-icons-page-4-5b62ba06c36336.0063904315331968068003.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                  khight,
                  buildTextField(
                    hint: "Name",
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  khight,
                  buildTextField(
                    hint: "School",
                    controller: _schoolnameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a school name';
                      }
                      return null;
                    },
                  ),
                  khight,
                  buildTextField(
                    hint: "Age",
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an age';
                      }
                      if (int.tryParse(value) == null ||
                          value.length > 2 ||
                          int.parse(value) == 0) {
                        return 'Please enter a valid age';
                      }
                      return null;
                    },
                  ),
                  khight,
                  buildTextField(
                    hint: 'Phone',
                    controller: _phonenameController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  khight,
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        final name = _nameController.text;
                        final school = _schoolnameController.text;
                        final age = _ageController.text;
                        final phone = _phonenameController.text;
                        final studentupdate = Student(
                          id: student.id,
                          name: name,
                          school: school,
                          age: int.parse(age),
                          phone: int.parse(phone),
                          profileimg: editStudentProvider.profileImgPath ??
                              student.profileimg,
                        );
                        DatabaseHelper datahelp = DatabaseHelper();
                        datahelp.updateStudent(studentupdate).then(
                          (id) {
                            if (id > 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Student updated successfully')),
                              );
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Failed to update student')),
                              );
                            }
                          },
                        );
                      }
                      editStudentProvider.clearImage();
                      HomePageProvider hprovider = HomePageProvider();
                      hprovider.refreshStudentList();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SAVE"),
                        kwidth2,
                        Icon(Icons.save),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
