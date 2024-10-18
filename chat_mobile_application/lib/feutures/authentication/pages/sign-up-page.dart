
import 'package:chat_mobile_application/feutures/authentication/pages/login-page.dart';
import 'package:chat_mobile_application/feutures/authentication/widget.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  String? _emailError;
  Color _borderColorForEmail = Colors.grey;
  String? _passwordError;
  bool _isLoading = false; 

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
 void goToLogInPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
  void clearFields() {
    _usernameController.clear();
    _confirmPasswordController.clear();
    _passwordController.clear();
    _nameController.clear();
  }
 void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }
  void signUpUser()  {
   
    if (_emailError != null || _isLoading) {
      return;
    }

    final name = _nameController.text;
    final username = _usernameController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      setState(() {
        _passwordError = 'Passwords do not match';
      });
      return;
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height:120),
                  const Text(
                    'Create An Account for Free',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                     
                      const SizedBox(height: 40),
                  
                      TextField(
                        controller: _nameController,
                        decoration: customInputDecoration(
                          labelText: 'Name',
                          suffixIcon: const Icon(Icons.person, color: Colors.blue),
                        ),
                      ),
                      const SizedBox(height: 20),
                  
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Email',
                          suffixIcon: const Icon(Icons.email, color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: _borderColorForEmail, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.red, width: 2.0),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2.0),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              _emailError = 'Please enter your email address';
                              _borderColorForEmail = Colors.red;
                            });
                          } else if (!isValidEmail(value)) {
                            setState(() {
                              _emailError = 'Please enter a valid email';
                              _borderColorForEmail = Colors.red;
                            });
                          } else {
                            setState(() {
                              _emailError = null;
                              _borderColorForEmail = Colors.blue;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      if (_emailError != null)
                        Text(
                          _emailError!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 20),
                  
                      TextField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: passwordInputDecoration(
                          labelText: 'Password',
                          isPasswordVisible: _isPasswordVisible,
                          togglePasswordVisibility: _togglePasswordVisibility,
                        ),
                      ),
                      const SizedBox(height: 20),
                  
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: !_isConfirmPasswordVisible,
                        decoration: passwordInputDecoration(
                          labelText: 'Confirm Password',
                          isPasswordVisible: _isConfirmPasswordVisible,
                          togglePasswordVisibility: _toggleConfirmPasswordVisibility,
                        ),
                      ),
                      if (_passwordError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            _passwordError!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      const SizedBox(height: 30),
                  
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: signUpUser, 
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Colors.blue,
                          ),
                          child:  _isLoading ? const CircularProgressIndicator(color:Colors.white,):
                              const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 15),
                  
                      TextButton(
                        onPressed: goToLogInPage,
                        child: RichText(
                          text: const TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: 'Log in',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}