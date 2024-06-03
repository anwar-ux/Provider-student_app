import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app_provider/core/colors.dart';
import 'package:student_app_provider/database/database.dart';
import 'package:student_app_provider/model/model.dart';
import 'package:student_app_provider/provider/add_page_provider.dart';
import 'package:student_app_provider/widgets/text_field.dart';
import 'package:student_app_provider/widgets/widget.dart';

// ignore: must_be_immutable
class AddStudent extends StatelessWidget {
  AddStudent({super.key});

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final schoolnameController = TextEditingController();
  final phoneController = TextEditingController();
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("ADD STUDENT"),
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
                key: _formKey,
                child: Consumer<AddPageProvider>(
                  builder: (context, addPageProvider, _) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final image = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (image != null) {
                              Provider.of<AddPageProvider>(context,
                                      listen: false)
                                  .setImage(image);
                            }
                          },
                          child: addPageProvider.profileImgPath != null
                              ? Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: FileImage(File(
                                          addPageProvider.profileImgPath!)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.cyan.shade300),
                                  child: const Icon(Icons.add_a_photo),
                                ),
                        ),
                        khight,
                        buildTextField(
                          hint: "Name",
                          controller: nameController,
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
                          controller: schoolnameController,
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
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an age';
                            } else if (int.tryParse(value) == null ||
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
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a phone number';
                            }
                            if (value.length != 10) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                        ),
                        khight,
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final name = nameController.text;
                              final school = schoolnameController.text;
                              final age = ageController.text;
                              final phone = phoneController.text;
                              final student = Student(
                                id: 0,
                                name: name,
                                school: school,
                                age: int.parse(age),
                                phone: int.parse(phone),
                                profileimg: addPageProvider.profileImgPath!,
                              );
                              addPageProvider.clearImage();
                              databaseHelper.insertStudent(student).then((id) {
                                if (id > 0) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Student added successfully')),
                                  );
                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Failed to add student')),
                                  );
                                }
                              });
                              Provider.of<AddPageProvider>(context,
                                      listen: false)
                                  .clearImage();
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("SAVE"),
                              kwidth2,
                              Icon(Icons.save),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}
