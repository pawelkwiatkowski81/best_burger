import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCratingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(isCratingAccount == true ? 'SIGN UP' : 'LOGIN'),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(hintText: 'E-Mail'),
                controller: widget.emailController,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Password'),
                controller: widget.passwordController,
                obscureText: true,
              ),
              Text(errorMessage),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (isCratingAccount == true) {
                    //Sign UP !!!
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  } else {
                    // LogIn !!!
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  }

                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: widget.emailController.text,
                      password: widget.passwordController.text,
                    );
                  } catch (error) {
                    setState(() {
                      errorMessage = error.toString();
                    });
                  }
                },
                child: Text(isCratingAccount == true ? 'SIGN UP' : 'LOGIN'),
              ),
              const SizedBox(height: 20),
              if (isCratingAccount == false) ...[
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        isCratingAccount = true;
                      },
                    );
                  },
                  child: const Text('SIGN UP'),
                )
              ],
              if (isCratingAccount == true) ...[
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        isCratingAccount = false;
                      },
                    );
                  },
                  child: const Text('Do You have an Account ?'),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}
