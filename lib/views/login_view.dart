// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/core/helper/app_pop_up.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/utils/app_constantc.dart';
import 'package:chat_app/core/widgets/custom_btn.dart';
import 'package:chat_app/core/widgets/custom_text_btn.dart';
import 'package:chat_app/core/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  String? email, password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: CircularProgressIndicator(color: Colors.blueAccent),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 2),

                Text(
                  "Scholar Chat",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Spacer(flex: 2),
                Row(
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                CustomTextField(
                  lableText: "Email",
                  onChanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  obscureText: true,
                  lableText: "Password",
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(height: 20),
                CustomBtn(
                  text: "Login",
                  onPressed: () async {
                    if (formKey.currentState?.validate() == false) return;
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      await login();
                      Navigator.pushNamed(
                        context,
                        AppRoutes.homeView,
                        arguments: email,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        AppPopUp.showSnackBar(
                          context,
                          'No user found for that email.',
                        );
                      } else if (e.code == 'wrong-password') {
                        AppPopUp.showSnackBar(
                          context,
                          'The password is incorrect.',
                        );
                      } else {
                        AppPopUp.showSnackBar(context, 'Error: ${e.message}');
                      }
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
                CustomTextBtn(
                  text: "Don't have an account ? ",
                  word: "Register",
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.registerView),
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> login() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
    return user;
  }
}
