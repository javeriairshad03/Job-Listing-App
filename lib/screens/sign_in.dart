import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191720),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 27.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 71.0),

            const Text(
              "Let’s sign you in", 
              style: TextStyle(
                fontSize: 35,
                color: Colors.white),
            ),

            SizedBox(height: 14),

            Text(
              "Welcome back\nyou’ve been missed!",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                height: 1.3,
              ),
            ),

            SizedBox(height: 67.0),

            // using method from below:
            _buildTextField(hint: "Enter your email address"),
            SizedBox(height: 20.0),
            _buildTextField(hint: "Enter your password", isPassword: true),

            SizedBox(height: 228.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ", 
                style: TextStyle(color: Color(0xFF8F8F9E))
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/signup'),
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500

                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 11.0),

            SizedBox(
              width: double.infinity,
              height: 71.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(15)
                  )
                ),

                onPressed: () => Navigator.pushNamed(context, '/home'),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
                ), 
                
            ),

            SizedBox(height: 20.0)
            
          ],
        ),
      ),
    );
  }

  // build input Text Feild, priv method
  Widget _buildTextField({required String hint, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),

      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF8F8F9E)),
        filled: true,
        fillColor: Color(0xFF5D5D67),
        contentPadding: EdgeInsets.symmetric(horizontal: 23.0, vertical: 15.0),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xFF5D5D67))
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white)
        ),

      ),
    );

  } // _buildTextField

} // SignUp