import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Burnstien'),
        backgroundColor: Color(0xFF3B2D1F),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Burnstien',
                  style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 48,
                    color: Color(0xFF3B2D1F),
                  ),
                ),
                const SizedBox(height: 32),
                CupertinoTextField(
                  controller: usernameController,
                  placeholder: 'Username',
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F1D0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 16),
                CupertinoTextField(
                  controller: passwordController,
                  placeholder: 'Password',
                  obscureText: true,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F1D0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffix: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Icon(CupertinoIcons.eye, size: 20, color: Color(0xFF3B2D1F)),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(fontSize: 14, color: Color(0xFFD37A1F)),
                    ),
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: const Text('Forgot password?'),
                            content: const Text('We forgot it too, ☺'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFFD37A1F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onPressed: () {
                    String enteredUsername = usernameController.text.trim();
                    String enteredPassword = passwordController.text.trim();

                    if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: const Text('Missing Input'),
                            content: const Text('Please enter both username and password.'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }

                    if (enteredUsername == 'bern' && enteredPassword == '123') {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder: (context) => const HomePage()),
                      );
                    } else {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: const Text('Invalid Credentials'),
                            content: const Text('Invalid username or password.'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
                const SizedBox(height: 24),
                const Row(
                  children: <Widget>[
                    Expanded(child: Divider(color: Color(0xFFD37A1F))),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('OR', style: TextStyle(color: Color(0xFF3B2D1F))),
                    ),
                    Expanded(child: Divider(color: Color(0xFFD37A1F))),
                  ],
                ),
                const SizedBox(height: 24),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(CupertinoIcons.infinite, color: Color(0xFFD37A1F)),
                      SizedBox(width: 8),
                      Text('Log in with Facebook', style: TextStyle(color: Color(0xFFD37A1F))),
                    ],
                  ),
                  onPressed: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: const Text('Under Development'),
                          content: const Text('This feature is currently under development.'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}