import 'package:firebase_s_flutter/screens/login_screen.dart';
import 'package:firebase_s_flutter/services/firebase_service.dart';
import 'package:firebase_s_flutter/services/strings.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 122, 149, 171),
      body: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.only(top: 150, right: 20, left: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(Strings.sign_up,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
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
                      hintText: Strings.edit_name_user,
                      labelText: Strings.label_name_user),
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.call,
                      size: 20,
                      color: Colors.black,
                    ),
                    hintText: Strings.edit_phone_user,
                    labelText: Strings.label_phone_user,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        size: 20,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: Strings.edit_email_user,
                      labelText: Strings.label_email_user),
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                        size: 20,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: Strings.edit_pwd_user,
                      labelText: Strings.label_pwd_user),
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
                const SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  height: 50,
                  minWidth: double.infinity,
                  color: const Color.fromARGB(255, 4, 109, 109),
                  onPressed: () {
                    FirebaseService.signUpAuth(
                        nameController.text.trim(),
                        emailController.text.trim(),
                        passwordController.text,
                        phoneController.text,
                        context);
                    // FirebaseService.signUpAuth(
                    //     nameController.text.trim(),
                    //     emailController.text.trim(),
                    //     passwordController.text.trim(),
                    //     phoneController.text.trim(),
                    //     context);

                    //Object from firebaseauth

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext) => const LoginScreen()));
                  },
                  child: Text(
                    Strings.sign_up,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.account_validation,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Text(
                          Strings.login,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 4, 109, 109),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
