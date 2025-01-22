
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }


}

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> final_formkey = GlobalKey<FormState>();

  LoginScreen({super.key});
  
  get white => null;
  
  get _formkey => null;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key:_formkey,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //App Logo
                  const Icon(
                    Icons.lock_outline,
                    size: 80,
                    color: Color.fromARGB(255, 68, 173, 237),
                  ),
                  const SizedBox(height:20),

                  //Title
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  //Email Input
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'\s+@\s+\.\s+').hasMatch(value)) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Passwoed Input
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    
                  ),
                  const SizedBox(height: 20),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          // Handle login logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Logging in...')),

                          );
                        }
                      },
                       child: const Text('Login'),
                    ),
                  ),

                  // Forgot Password
                  TextButton(
                    onPressed: () {
                      // Navigate to Forgot Password screen
                    },
                    child: const Text('Forgot Password'),
                  ),

                  const SizedBox(height: 20),

                  // Sign-up Option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          //Navigate to Sign-up screen
                          
                        },
                        child: const Text('Sign Up'),
                      )
                    ]
                  )
                ]
              )
            )
          )
        )
      )
    );
  }
}