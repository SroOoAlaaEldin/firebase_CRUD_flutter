import 'package:firebase_s_flutter/screens/signup_screen.dart';
import 'package:firebase_s_flutter/services/firebase_service.dart';
import 'package:firebase_s_flutter/services/strings.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100, right: 20, left: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(Strings.login,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold)),
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
                    hintText: Strings.edit_email_user,
                    labelText: Strings.label_email_user,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.visibility_off,
                    size: 20,
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 20,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: Strings.edit_pwd_user,
                  labelText: Strings.label_pwd_user,
                ),
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: const Color.fromARGB(255, 4, 109, 109),
                onPressed: () {
                  FirebaseService.loginAuth(emailController.text.trim(),
                      passwordController.text, context);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: Text(
                  Strings.login,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.account_new,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: Text(
                        Strings.sign_up,
                        style: TextStyle(
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
    );
  }
}
