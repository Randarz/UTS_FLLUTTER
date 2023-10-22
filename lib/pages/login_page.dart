import 'package:flutter/material.dart';
import 'package:uts/components/my_textfield.dart';
import 'package:uts/components/square_tile.dart';
import 'package:uts/components/success_page.dart';
// sign user in method
  class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  void signUserIn() {
    setState(() {
      isLoading = true;
    });

  Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SuccessPage()));

   ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login berhasil!"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // welcome back, you've been missed!
              const Text(
                'Welcome to A*Linium!',
                style: TextStyle(
                  color: Color.fromARGB(244, 36, 7, 7),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 50),

              // logo
              const Icon(
                Icons.star_half_sharp,
                size: 100,
              ),

              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Are you ready to explore the galaxy?',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: isLoading ? null : signUserIn,
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Mengubah warna latar belakang menjadi hitam
              ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
              ),

  
               const SizedBox(height: 25),
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

              const SizedBox(height: 50),

              // google + apple sign in buttons
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SquareTile(imagePath: 'lib/images/google.png'),

                  SizedBox(width: 25),

                  // apple button
                  SquareTile(imagePath: 'lib/images/facebook-transparent-icon-15.png'),

                  SizedBox(width: 25),

                  // facebook button
                  SquareTile(imagePath: 'lib/images/apple.png')

                ],
              ),

              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}