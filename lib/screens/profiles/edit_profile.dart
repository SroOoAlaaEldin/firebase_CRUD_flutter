import 'package:firebase_s_flutter/services/strings.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  Map<String, dynamic>? userDetails;
  EditProfile({super.key, required this.userDetails});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<Map<String, dynamic>>? getUserDetails;
  @override
  void initState() {
    setState(() {
      nameController.text = widget.userDetails?['name'];
      passwordController.text = widget.userDetails!['password'];
      phoneController.text = widget.userDetails!['phone'];
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 4, 109, 109),
          title: Text(
            Strings.edit_my_profile,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.label_full_name_user,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 2,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  //  hintText: 'Enter Your Email',
                  //  labelText: 'Email'
                ),
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),

              //////////////////////Password//////////////////////////
              Text(
                Strings.label_pwd_user,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 2,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 20,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  //  hintText: 'Enter Your Email',
                  //labelText: 'Email'
                ),
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              //////////////////////Phone//////////////////////////
              Text(
                Strings.label_phone_user,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 2,
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.call,
                    size: 20,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  //  labelText: 'Phone'
                ),
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ));
  }
}
