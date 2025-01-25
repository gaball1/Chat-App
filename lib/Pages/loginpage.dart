import 'package:chatapp/Pages/Chatpage.dart';
import 'package:chatapp/Pages/SignupPage.dart';
import 'package:chatapp/Widgets/Constants.dart';
import 'package:chatapp/Widgets/Custom_button.dart';
import 'package:chatapp/Widgets/Custom_text_field.dart';
import 'package:chatapp/helper/Show-Snack-Bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

String? password;

String? Email;

class _LoginPageState extends State<LoginPage> {
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
                      'LOGIN',
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
                  obscureText: true,
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
                        await LoginUser();
                        Navigator.pushNamed(context, ChatPage.id,
                            arguments: Email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          ShowSnacks(context, 'User Not Found');
                        } else if (e.code == 'wrong-password') {
                          ShowSnacks(context, 'Wrong Password');
                        }
                      } catch (e) {
                        ShowSnacks(context, 'there was an error');
                      }
                      isloading = false;
                      setState(() {});
                    }
                  },
                  ButtonName: 'LOGIN',
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'don\'t have an Acount ?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUP.id);
                      },
                      child: Text(
                        ' Register',
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

  Future<void> LoginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: Email!, password: password!);
  }
}
