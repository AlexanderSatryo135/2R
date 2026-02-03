import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0096FF), // Background Biru (Header)
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            // ==========================================
            // 1. DEKORASI HEADER (Shape Ungu Kiri Atas)
            // ==========================================
            Positioned(
              left: -1,
              top: -5,
              child: Container(
                width: 215,
                height: 128,
                decoration: const ShapeDecoration(
                  color: Color(0xFF5800FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(80),
                    ),
                  ),
                ),
              ),
            ),

            // ==========================================
            // 2. KARTU PUTIH UTAMA
            // ==========================================
            Positioned(
              top: 185, // Mulai dari bawah header
              left: 0,
              right: 0,
              bottom: 0, // Mentok sampai bawah layar
              child: Container(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        60,
                      ), // Sudut atas kartu tetap besar
                      topRight: Radius.circular(60),
                    ),
                  ),
                ),
                // SingleChildScrollView agar aman di layar kecil
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Column(
                    children: [
                      const SizedBox(height: 40), // Jarak dari atas kartu
                      // JUDUL
                      Text(
                        'Sign Up!',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // SUBJUDUL
                      Text(
                        'Create a new account in order \nto Sign In later!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 50), // Jarak ke input pertama
                      // INPUT FORM 1: EMAIL
                      _buildRoundedTextField(hint: "Email"),

                      const SizedBox(height: 20), // Jarak antar input
                      // INPUT FORM 2: USERNAME
                      _buildRoundedTextField(hint: "Username"),

                      const SizedBox(height: 20), // Jarak antar input
                      // INPUT FORM 3: PASSWORD
                      _buildRoundedTextField(
                        hint: "Password",
                        isPassword: true,
                      ),

                      const SizedBox(height: 40), // Jarak ke tombol
                      // TOMBOL SIGN UP (Cyan)
                      SizedBox(
                        width: double.infinity, // Lebar penuh
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            // Logika Sign Up
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                              0xFF00D7FF,
                            ), // Warna Cyan
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15,
                              ), // Radius 15 sesuai desain baru
                              side: const BorderSide(
                                width: 1,
                              ), // Border hitam tipis
                            ),
                            elevation: 0, // Hilangkan bayangan
                          ),
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 80), // Jarak ke footer
                      // FOOTER (Link ke Sign In)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context); // Kembali ke Login
                            },
                            child: Text(
                              'Sign In',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30), // Padding bawah tambahan
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk Input Field dengan Radius 15
  Widget _buildRoundedTextField({
    required String hint,
    bool isPassword = false,
  }) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15), // Radius 15 sesuai desain baru
        border: Border.all(width: 1, color: Colors.black), // Border hitam
      ),
      child: Center(
        child: TextField(
          obscureText: isPassword,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              color: const Color(0xFFC2C2C2),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
            ), // Padding dalam teks
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
