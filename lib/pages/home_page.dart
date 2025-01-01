import 'package:flutter/material.dart';
import 'package:socialmediaemsi/components/my_drawer.dart';
import 'package:socialmediaemsi/components/my_textfield.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // text controller
  final TextEditingController newPostController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("W A L L"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          //TEXTFIELD BOX FOR USER TO TYPE
          MyTextfield(
            hintText: "Say something..",
            obscureText: false,
            controller: newPostController,
          ),
        ],
      ),
    );
  }
}
