import 'package:firebase_s_flutter/screens/profiles/edit_profile.dart';
import 'package:firebase_s_flutter/screens/profiles/notifications_profile.dart';
import 'package:firebase_s_flutter/services/firebase_service.dart';
import 'package:firebase_s_flutter/services/strings.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  String email;
  ProfilePage({super.key, required this.email});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userEmail = '';

  Map<String, dynamic>? userDetials;
  Future<Map<String, dynamic>?> getUserData() async {
    userDetials = await FirebaseService.getUserData(userEmail);
    setState(() {});
    return null;
  }

  @override
  void initState() {
    userEmail = widget.email;
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 4, 109, 109),
          title: Text(
            Strings.my_profile,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 5,
            left: 10,
            right: 10,
            // left: 70,
            // right: 70,
          ),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 50, right: 20, left: 20),
                    alignment: Alignment.topCenter,
                    width: 220,
                    height: 240,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 4, 109, 109),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/images/back.png'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          userDetials != null ? userDetials!['name'] : '',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          userDetials != null ? userDetials!['email'] : '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          userDetials != null ? userDetials!['phone'] : '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      children: [
                        ProfileOption(
                          icon: Icons.person,
                          title: Strings.edit_my_profile,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile(
                                          userDetails: userDetials,
                                        )));
                          },
                        ),
                        ProfileOption(
                          icon: Icons.notifications,
                          title: Strings.notfication,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationsProfile()));
                          },
                        ),
                        ProfileOption(
                          icon: Icons.settings,
                          title: Strings.settings,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationsProfile()));
                          },
                        ),
                        ProfileOption(
                          icon: Icons.lock,
                          title: Strings.privacy,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationsProfile()));
                          },
                        ),
                        ProfileOption(
                          icon: Icons.delete,
                          title: Strings.delete,
                          onTap: () {},
                        ),
                        ProfileOption(
                          icon: Icons.logout,
                          title: Strings.logout,
                          onTap: () {
                            FirebaseService.logout(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  // TextFormField(
                  //   //   controller: phoneController,
                  //   decoration: InputDecoration(
                  //     fillColor: Colors.white,
                  //     prefixIcon: const Icon(
                  //       Icons.person,
                  //       size: 20,
                  //       color: Colors.black,
                  //     ),
                  //     suffixIcon: const Icon(
                  //       Icons.arrow_right,
                  //       size: 20,
                  //       color: Colors.black,
                  //     ),

                  //     // hintText: 'Enter Your Phone',
                  //     labelText: 'MyProfile',
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15),
                  //     ),
                  //   ),
                  //   style: const TextStyle(color: Colors.black, fontSize: 15),
                  // ),
                  // MaterialButton(
                  //   color: Colors.white,
                  //   onPressed: () {},
                  //   child: Text(
                  //     'MyProfile',
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ));
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  ProfileOption({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 100,
        // height: double.infinity,
        margin: const EdgeInsets.only(bottom: 15, right: 5, left: 5),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color.fromARGB(255, 4, 109, 109),
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
