import 'package:flutter/material.dart';
import 'package:socialmediaemsi/components/my_button.dart';
import 'package:socialmediaemsi/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),
            Text("M I N I M A L",
                style: TextStyle(
                  fontSize: 20,
                )),
            const SizedBox(height: 50),
            MyTextfield(
              hintText: "Username",
              obscureText: false,
              controller: usernameController,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: emailController,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              hintText: "Verify Password",
              obscureText: true,
              controller: confirmpasswordController,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot password?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary)),
              ],
            ),
            const SizedBox(height: 25),
            MyButton(
              text: "Register",
              onTap: register,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary)),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login here",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
