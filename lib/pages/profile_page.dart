import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmediaemsi/components/my_back_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  //current logged user

  final User? currentUser = FirebaseAuth.instance.currentUser;

  //futur fetch user deails

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Profile"),
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   elevation: 0,
      // ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: getUserDetails(),
          builder: (context, snapshot) {
            //loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            //error
            else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }

            //data
            else if (snapshot.hasData) {
              Map<String, dynamic>? user = snapshot.data!.data();

              return Center(
                child: Column(
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

                    const SizedBox(height: 25),
                    //profile image
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.all(25),
                      child: Icon(
                        Icons.person,
                        size: 64,
                      ),
                    ),

                    const SizedBox(height: 25),
                    //email
                    Text(
                      user!['email'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //username
                    Text(
                      user['username'],
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text("No data"),
              );
            }
          }),
    );
  }
}
