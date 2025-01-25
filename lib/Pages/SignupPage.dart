import 'package:chatapp/Pages/Chatpage.dart';
import 'package:chatapp/Pages/loginpage.dart';
import 'package:chatapp/Widgets/Constants.dart';
import 'package:chatapp/Widgets/Custom_text_field.dart';
import 'package:chatapp/helper/Show-Snack-Bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Widgets/Custom_button.dart';

class SignUP extends StatefulWidget {
  SignUP({super.key});
  static String id = 'SignUP';

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  String? password;

  String? Email;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                const SizedBox(height: 75),
                Image.asset(
                  KLogo,
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'Pacifico'),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                Row(
                  children: [
                    Text(
                      'SIGNUP',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  onChanged: (data) {
                    Email = data;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        await registerUser();
                        Navigator.pushNamed(context, ChatPage.id);
                        ShowSnacks(context, 'Success');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          ShowSnacks(
                              context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          ShowSnacks(context,
                              'The account already exists for that email.');
                        }
                      } catch (e) {
                        ShowSnacks(context, 'there was an error');
                      }
                      isloading = false;
                      setState(() {});
                    }
                  },
                  ButtonName: 'SIGNUP',
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an Acount ?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        ' Log IN',
                        style: TextStyle(
                          color: Color(0xffc7EDE6),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: Email!, password: password!);
  }
}
