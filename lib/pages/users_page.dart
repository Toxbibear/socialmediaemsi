import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialmediaemsi/components/my_back_button.dart';
import 'package:socialmediaemsi/components/my_list_tile.dart';
import 'package:socialmediaemsi/helper/helper_fuctions.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Users"),
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context, snapshot) {
            // any errors
            if (snapshot.hasError) {
              displayMessageToUser("Something went wrong", context);
            }

            // show loading circle
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == null) {
              return const Center(
                child: Text("No users found"),
              );
            }
            final users = snapshot.data!.docs;

            return Column(
              children: [
                //back button
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 25.0),
                  child: Row(
                    children: [
                      MyBackButton(),
                    ],
                  ),
                ),
                //list of users
                Expanded(
                  child: ListView.builder(
                      itemCount: users.length,
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (context, index) {
                        final user = users[index];

                        String username = user['username'];
                        String email = user['email'];

                        return MyListTile(title: username, subTitle: email);
                      }),
                ),
              ],
            );
          }),
    );
  }
}
