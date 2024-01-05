import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    Widget buildTextInput(
      String hintText,
      TextEditingController textController,
    ) {
      return TextFormField(
        controller: textController,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: hintText,
          border: const OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if ((value ?? '').isEmpty) {
            return "Field need to be filled";
          }
          return null;
        },
      ).py8();
    }

    Widget buildButton(String text, Function() onTap) {
      return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ).py12();
    }

    Color bgColor = Colors.black12;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Test'),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [bgColor, Colors.green.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                buildTextInput('Staff ID', controller.staffId),
                buildTextInput('Staff Name', controller.staffName),
                buildTextInput('Hobby', controller.staffHobby),
                buildTextInput('Password', controller.staffPassword),
                buildTextInput('Confirm Password', controller.staffPassword2),
                buildButton('Submit', controller.submit),
              ],
            ).px12(),
          ),
        ),
      ),
    );
  }
}
