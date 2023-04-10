import 'package:chatapp/main.dart';
import 'package:chatapp/src/auth/services/auth_service.dart';
import 'package:chatapp/src/home/screens/homepage.dart';
import 'package:chatapp/src/widgets/button.dart';
import 'package:chatapp/src/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../utils/validator.dart';

AuthServiceStore authStore = AuthServiceStore();

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  // text editing controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 50),

            // logo
            const Icon(
              Icons.lock,
              size: 100,
            ),

            const SizedBox(height: 50),

            // welcome back, you've been missed!
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 25),

            Observer(
              builder: (context) {
                if (!appStore.isLogin) {
                  // Display Name
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                        controller: _nameController,
                        hintText: 'Display Name',
                        validator: (value) => Validator.validateName(name: value!),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),

            // username textfield
            AppTextField(
              controller: _emailController,
              hintText: 'Email',
              validator: (value) => Validator.validateEmail(email: value!),
            ),

            const SizedBox(height: 10),

            // password textfield
            AppTextField(
              controller: _passwordController,
              hintText: 'Password',
              obscureText: true,
              validator: (value) => Validator.validatePassword(password: value!),
            ),

            const SizedBox(height: 25),

            // sign in button
            Observer(
              builder: (context) {
                if (appStore.isLoading) return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black)));

                return AppButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      appStore.setLoading(loading: true);

                      if (appStore.isLogin) {
                        await authStore.signInWithEmailPassword(_emailController.text, _passwordController.text).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage())));
                      } else {
                        await authStore.signupWithEmailPassword(_nameController.text, _emailController.text, _passwordController.text).then((User? user) {
                          if (user != null) {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                          }
                        });
                      }
                    }
                    appStore.setLoading(loading: false);
                  },
                  title: appStore.isLogin ? "Sign In" : "Sign Up",
                );
              },
            ),

            const SizedBox(height: 30),

            // or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // google + apple sign in buttons
            Observer(builder: (context) {
              if (appStore.isLoading) return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SocialLoginButton(
                    onTap: () async {
                      appStore.setLoading(loading: true);

                      await authStore.signInWithGoogle().then((user) {
                        if (user != null) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }
                      });
                      appStore.setLoading(loading: false);
                    },
                    imagePath: 'assets/img/google.png',
                  ),

                  const SizedBox(width: 25),

                  // apple button
                  SocialLoginButton(
                    onTap: () async {
                      appStore.setLoading(loading: true);
                      await authStore.signInWithFacebook().then((user) {
                        if (user != null) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }
                      });
                      appStore.setLoading(loading: false);
                    },
                    imagePath: 'assets/img/facebook.png',
                  )
                ],
              );
            }),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () => appStore.setLogin(),
              child: const Text(
                'Register now',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
