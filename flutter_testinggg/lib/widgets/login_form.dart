import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final void Function(String username, String password) onLogin;

  const LoginForm({super.key, required this.onLogin});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    final username = userController.text.trim();
    final password = passController.text.trim();
    widget.onLogin(username, password);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(28),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                spreadRadius: 2,
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Judul login
              const Text(
                'Welcome Back 👋',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF009688), // Tosca
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Please login to continue',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 32),

              // Username
              TextFormField(
                key: const Key('username'),
                controller: userController,
                decoration: InputDecoration(
                  hintText: 'Username or Email',
                  prefixIcon:
                      const Icon(Icons.person_outline, color: Color(0xFF009688)),
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5), // abu muda
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Password
              TextFormField(
                key: const Key('password'),
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon:
                      const Icon(Icons.lock_outline, color: Color(0xFF009688)),
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Tombol login
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: const Key('login_button'),
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                  ).copyWith(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => null,
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF009688), Color(0xFF4DD0E1)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
