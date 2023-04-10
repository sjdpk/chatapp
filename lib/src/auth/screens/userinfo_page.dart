import 'package:flutter/material.dart';
import '../../utils/common.dart';
import 'signin_page.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Profile "),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              authStore.user?.photoURL != null
                  ? ClipOval(
                      child: Material(
                        color: Colors.grey.withOpacity(0.3),
                        child: Image.network(
                          authStore.user!.photoURL!,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  : ClipOval(
                      child: Material(
                        color: Colors.grey.withOpacity(0.3),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.person,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 16.0),
              Text(
                greeting(),
                style: const TextStyle(
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                authStore.user!.displayName ?? "",
                style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '( ${authStore.user!.email!} )',
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 24.0),
              OutlinedButton(
                onPressed: () async => {
                  await authStore.signOut(),
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignInScreen()))
                },
                child: const Text("Sign Out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
