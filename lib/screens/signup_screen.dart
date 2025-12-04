import 'package:flutter/material.dart';
import 'package:leadxpert/core/constants/app_colors.dart';
import 'package:leadxpert/screens/login_screen.dart';
import 'package:leadxpert/widgets/my_button.dart';
import 'package:leadxpert/widgets/my_textfield.dart';
import 'package:leadxpert/widgets/social_login_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                  MyTextfield(onChanged: (value) {}, text: 'Full Name'),
                  const SizedBox(height: 16),
                  Text(
                    "Email address",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),

                  MyTextfield(onChanged: (value) {}, text: 'Email'),
                  const SizedBox(height: 16),
                  Text(
                    "Password",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  MyTextfield(onChanged: (value) {}, text: 'Password'),
                  const SizedBox(height: 16),
                  MyTextfield(onChanged: (value) {}, text: 'Confirm Password'),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Checkbox(
                        value: false, // The current state of the checkbox
                        onChanged: (bool? newValue) {
                          // Callback when the checkbox state changes
                        },
                        activeColor: Colors.blue, // Color when checked
                        checkColor: Colors.white, // Color of the checkmark
                      ),
                      Text("I agree to the Terms and Conditions"),
                    ],
                  ),
                  const SizedBox(height: 24),
                  MyButton(
                    text: 'Sign Up',
                    onPressed: () {
                      const login = LoginScreen();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => login),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to register screen
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
                        child: Icon(
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
                        child: Icon(Icons.apple, color: Colors.black, size: 28),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
