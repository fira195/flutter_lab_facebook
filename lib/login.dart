import 'package:flutter/material.dart';
import './homepage.dart';
import './register.dart ';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 40),

          TextField(
            controller: emailController,
            obscureText: false,
            decoration: InputDecoration(
              hintText: "abcd@gmail.com",
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),

          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "......",
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: 100,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1877F2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // TEMP LOGIN ACTION
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
              child: const Text(
                "Log In",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),


          const SizedBox(height: 30),

          const Divider(),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF1877F2)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()),
                );
              },
              child: const Text(
                "Create new account",
                style: TextStyle(
                  color: Color(0xFF1877F2),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//   Widget _createAccountButton() {
//     return SizedBox(
//       width: double.infinity,
//       height: 48,
//       child: OutlinedButton(
//         style: OutlinedButton.styleFrom(
//           side: const BorderSide(color: Color(0xFF1877F2)),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         onPressed: () {},
//         child: const Text(
//           "Create new account",
//           style: TextStyle(
//             color: Color(0xFF1877F2),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
