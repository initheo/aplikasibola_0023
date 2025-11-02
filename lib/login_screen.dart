import 'package:aplikasibola_0023/home_screen.dart';
import 'package:aplikasibola_0023/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtr = TextEditingController();
  final _passwordCtr = TextEditingController();
  bool _isObscureText = true;

  // Daftar domain email yang diizinkan
  final List<String> _allowedDomains = ['@gmail.com'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/id/thumb/0/0d/Logo_Persib_Bandung.png/520px-Logo_Persib_Bandung.png',
                    height: 300,
                  ),

                  const SizedBox(height: 30),

                  // judul
                  const Text(
                    'Selamat Datang Bobotoh!',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // subjudul
                  const Text(
                    'Silahkan login untuk melanjutkan ke aplikasi Persib\nBandung Official.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 35),

                  // Email Field
                  TextFormField(
                    controller: _emailCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Validasi format email ('@')
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      // Validasi domain yang diizinkan
                      bool validDomain = _allowedDomains.any(
                        (domain) => value.endsWith(domain),
                      );
                      if (!validDomain) {
                        return 'Email harus berakhiran ${_allowedDomains.join(", ")}';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      floatingLabelStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Masukkan email Anda',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Password Field
                  TextFormField(
                    controller: _passwordCtr,
                    obscureText: _isObscureText,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      floatingLabelStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Masukkan Password Anda',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscureText = !_isObscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen(email: _emailCtr.text),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Link ke Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Apakah belum punya akun?  ',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Daftar disini',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
