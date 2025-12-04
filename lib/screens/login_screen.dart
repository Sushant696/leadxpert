import 'package:flutter/material.dart';
import 'package:leadxpert/core/constants/app_colors.dart';
import 'package:leadxpert/widgets/my_button.dart';
import 'package:leadxpert/widgets/my_textfield.dart';
import 'package:leadxpert/widgets/social_login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome!',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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

                  MyTextfield(onChanged: (value) {}, text: 'Email'),
                  const SizedBox(height: 16),
                  MyTextfield(onChanged: (value) {}, text: 'Password'),
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

                  MyButton(
                    text: 'Login',
                    onPressed: () {
                      // Handle login action
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
  }
}
