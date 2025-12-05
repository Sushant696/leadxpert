import 'package:flutter/material.dart';
import 'package:leadxpert/core/constants/app_colors.dart';
import 'package:leadxpert/screens/home_screen.dart';
import 'package:leadxpert/screens/login_screen.dart';
import 'package:leadxpert/widgets/my_button.dart';
import 'package:leadxpert/widgets/my_textfield.dart';
import 'package:leadxpert/widgets/social_login_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _agreedToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitSignup() {
    final form = _formKey.currentState;
    if (form != null && form.validate() && _agreedToTerms) {
      // Basic mock success action — replace with real auth later.
    } else if (!_agreedToTerms) {
      // Show error message or handle invalid form
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors in the form')),
      );
    }
  }

  String? _nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your full name';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    final email = value.trim();
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}");
    if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Create an account to get started',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "Name",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    MyTextfield(
                      controller: _nameController,
                      onChanged: (value) {},
                      text: 'Full Name',
                      validator: _nameValidator,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Email address",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    MyTextfield(
                      controller: _emailController,
                      onChanged: (value) {},
                      text: 'Email',
                      validator: _emailValidator,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Password",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    MyTextfield(
                      controller: _passwordController,
                      onChanged: (value) {},
                      text: 'Password',
                      obscureText: true,
                      validator: _passwordValidator,
                    ),
                    const SizedBox(height: 16),
                    MyTextfield(
                      controller: _confirmPasswordController,
                      onChanged: (value) {},
                      text: 'Confirm Password',
                      obscureText: true,
                      validator: _confirmPasswordValidator,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Checkbox(
                          value: _agreedToTerms,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _agreedToTerms = newValue ?? false;
                            });
                          },
                          activeColor: Colors.blue,
                          checkColor: Colors.white,
                        ),
                        const Text("I agree to the Terms and Conditions"),
                      ],
                    ),
                    const SizedBox(height: 24),
                    MyButton(text: 'Sign Up', onPressed: _submitSignup),
                    const SizedBox(height: 24),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Already a member? ',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: 'Login now',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Divider with text
                    Row(
                      children: [
                        Expanded(
                          child: Divider(color: AppColors.border, thickness: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: AppColors.border, thickness: 1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialLoginButton(
                          onTap: () {
                            // Handle Google login
                          },
                          child: Image.asset(
                            'assets/images/google.png',
                            height: 24,
                            width: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        SocialLoginButton(
                          onTap: () {
                            // Handle Facebook login
                          },
                          child: const Icon(
                            Icons.facebook,
                            color: Color(0xFF1877F2),
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        SocialLoginButton(
                          onTap: () {
                            // Handle Apple login
                          },
                          child: const Icon(
                            Icons.apple,
                            color: Colors.black,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
