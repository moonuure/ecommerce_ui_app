import 'package:flutter/material.dart';
import '../screen/homepage.dart';

class TextFields extends StatefulWidget {
  const TextFields({super.key});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  bool obscureText = true;
  // Predefined username and password
  final String predefinedUsername = 'alka';
  final String predefinedPassword = 'pass';

  // Controllers for text fields
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Function to handle login button press
  void _handleLogin() {
    String enteredUsername = usernameController.text.trim();
    String enteredPassword = passwordController.text.trim();

    // Check if entered credentials match predefined values
    if (enteredUsername == predefinedUsername &&
        enteredPassword == predefinedPassword) {
      // So We want to move to the next screen only if the entered username and password perfectly align with our predefined credentials👇.
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LandingPage()));
    } else {
      // Show an error message for invalid credentials
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Invalid Credentials'),
          content: Text('Please enter a valid username and password.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: TextStyle(
                color: Colors.blue, // Change label text color
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.blue), // Change border color when not focused
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.green), // Change border color when focused
              ),
              prefixIcon: Icon(
                Icons.person, // Add an icon to the left of the text field
                color: Colors.blue,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons
                      .clear, // Add a clear button to the right of the text field
                  color: Colors.red,
                ),
                onPressed: () {
                  usernameController.clear();
                },
              ),
            ),
            cursorColor: Colors.blue, // Change text cursor color
          ),
          SizedBox(height: 10.0),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(
                color: Colors.blue, // Change label text color
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.blue), // Change border color when not focused
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.green), // Change border color when focused
              ),
              prefixIcon: Icon(
                Icons.lock, // Add a lock icon to the left of the text field
                color: Colors.blue,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons
                      .visibility, // Add a visibility icon to toggle password visibility
                  color: Colors.blue,
                ),
                onPressed: () {
                  // Toggle password visibility
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
            ),
            cursorColor: Colors.blue, // Change text cursor color
            // obscureText: obscureText,
          ),
          SizedBox(
            height: 25.0,
          ),
          ElevatedButton(
            onPressed: _handleLogin,
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
