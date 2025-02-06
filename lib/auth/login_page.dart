import 'package:flutter/material.dart';
import 'package:part_1/auth/register_page.dart';
import 'package:part_1/custom/custom_button.dart';
import 'package:part_1/custom/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  double _opacity = 0.0;
  double _circleOffset = -100;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
        _circleOffset = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFA6CDC6),
      body: Stack(
        children: [
          // Lingkaran Atas dengan animasi slide
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOut,
            top: _circleOffset - size.width * .1,
            right: _circleOffset - size.width * .1,
            child: CircleAvatar(
              radius: size.width * .2,
              backgroundColor: const Color(0xFFDDA853),
            ),
          ),

          // Form dengan animasi fade-in
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              opacity: _opacity,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * .075),
                width: size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * .055,
                  vertical: size.width * .075,
                ),
                height: size.height / 2,
                decoration: BoxDecoration(
                  color: const Color(0xFFFBF5DD).withOpacity(0.25),
                  borderRadius: BorderRadius.circular(size.width * .025),
                  border: Border.all(
                    width: 3,
                    color: const Color(0xFF16404D),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Form Login',
                      style: TextStyle(
                        fontSize: size.width * .075,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: size.width * .03),
                    Text(
                      'Silahkan isi form dibawah untuk login aplikasi.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * .03,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.width * .03),
                    CustomTextfield(size: size, labelText: 'Email'),
                    CustomTextfield(size: size, labelText: 'Password'),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _rememberMe = !_rememberMe;
                            });
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: const Color(0xFF16404D), width: 2),
                              color: _rememberMe ? const Color(0xFF16404D) : Colors.transparent,
                            ),
                            child: _rememberMe
                                ? const Icon(Icons.check, size: 16, color: Colors.white)
                                : null,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Ingat Saya',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: size.width * .03,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CustomButton(size: size, labelText: 'Login'),
                    SizedBox(height: size.width * .025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun?',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: size.width * .025,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            ' klik untuk Register',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: size.width * .025,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          // Lingkaran Bawah dengan animasi slide
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOut,
            bottom: _circleOffset - size.width * .125,
            left: _circleOffset - size.width * .125,
            child: CircleAvatar(
              radius: size.width * .25,
              backgroundColor: const Color(0xFFDDA853),
            ),
          ),
        ],
      ),
    );
  }
}
