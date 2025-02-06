import 'package:flutter/material.dart';
import 'package:part_1/auth/login_page.dart';
import 'package:part_1/custom/custom_button.dart';
import 'package:part_1/custom/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double _circleOffset = -100;
  double _opacity = 0.0;

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
            curve: Curves.easeInOut,
            top: _circleOffset - size.width * .1,
            left: _circleOffset - size.width * .1,
            child: CircleAvatar(
              radius: size.width * .2,
              backgroundColor: const Color(0xFFDDA853),
            ),
          ),

          //

          // Form
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
                height: size.height / 1.9,
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
                      'Form Register',
                      style: TextStyle(
                        fontSize: size.width * .075,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: size.width * .03),
                    Text(
                      'Silahkan isi form dibawah untuk register akun.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * .03,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.width * .03),
                    CustomTextfield(
                      size: size,
                      labelText: 'Nama',
                    ),
                    CustomTextfield(
                      size: size,
                      labelText: 'Email',
                    ),
                    CustomTextfield(
                      size: size,
                      labelText: 'Password',
                    ),
                    CustomButton(size: size, labelText: 'Register'),
                    SizedBox(height: size.width * .025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sudah punya akun?',
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
                                  builder: (context) => const LoginPage(),
                                  barrierDismissible: true),
                            );
                          },
                          child: Text(
                            ' klik untuk Login',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: size.width * .025,
                              fontWeight: FontWeight.w700,
                            ),
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          //

          // Lingkaran Bawah dengan animasi slide
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOut,
            bottom: _circleOffset - size.width * .125,
            right: _circleOffset - size.width * .125,
            child: CircleAvatar(
              radius: size.width * .25,
              backgroundColor: const Color(0xFFDDA853),
            ),
          ),

          //
        ],
      ),
    );
  }
}
