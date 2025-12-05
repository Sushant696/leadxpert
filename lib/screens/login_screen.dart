import 'package:flutter/material.dart';
import 'package:leadxpert/core/constants/app_colors.dart';
import 'package:leadxpert/screens/home_screen.dart';
import 'package:leadxpert/widgets/my_button.dart';
import 'package:leadxpert/widgets/my_textfield.dart';
import 'package:leadxpert/widgets/social_login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitLogin() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      // navigate to home screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // Show error message or handle invalid form
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Image.asset('assets/images/image.png', fit: BoxFit.cover),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Login to continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 32),

                    MyTextfield(
                      controller: _emailController,
                      onChanged: (value) {},
                      text: 'Email',
                      validator: _emailValidator,
                    ),
                    const SizedBox(height: 16),
                    MyTextfield(
                      controller: _passwordController,
                      onChanged: (value) {},
                      text: 'Password',
                      obscureText: true,
                      validator: _passwordValidator,
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          // Handle forgot password
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    MyButton(text: 'Login', onPressed: _submitLogin),
                    const SizedBox(height: 24),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Handle navigation to registration screen
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Not a member? ',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: 'Register now',
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
                          child: Icon(
                            Icons.facebook,
                            color: const Color(0xFF1877F2),
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
