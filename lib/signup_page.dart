import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase_services/auth_service.dart'; // Import custom Firebase service
import 'package:flutter_firebase/homepage.dart'; // Import HomePage screen
import 'package:flutter_firebase/login.dart'; // Import LoginPage screen

// This is the main widget for the signup page.
class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignupPageState(); // Creates the state for SignupPage
  }
}

// This is the state class for the SignupPage. It manages the UI and logic.
class SignupPageState extends State<SignupPage> {
  // Instance of FirebaseService to handle authentication
  final FirebaseService _auth = FirebaseService();

  // Controllers to manage the text input for username, email, and password fields
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Dispose method to clean up controllers when the widget is removed from the widget tree
  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  // The build method creates the UI of the signup page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold provides a basic structure for the app
      body: Container(
        // Container that holds the background image and other UI elements
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/j1.jpg"), // Set background image
            fit: BoxFit.cover, // Make the image cover the entire screen
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent, // Set background to transparent so the image shows through
          body: Column(
            children: [
              // This Container holds the "Sign_UP" header text
              Container(
                padding: EdgeInsets.only(left: 100, top: 20),
                child: Text(
                  "Sign_UP",
                  style: TextStyle(
                    fontSize: 50, // Set font size
                    fontWeight: FontWeight.bold, // Make text bold
                    color: Colors.black, // Set text color
                  ),
                ),
              ),
              // This Container holds the "WELCOME" message
              Container(
                padding: EdgeInsets.only(left: 100, top: 90),
                child: Text(
                  "WELCOME",
                  style: TextStyle(
                    fontSize: 50, // Set font size
                    fontWeight: FontWeight.bold, // Make text bold
                    color: Colors.white, // Set text color to white
                  ),
                ),
              ),
              // This Container holds the input field for the username
              Container(
                padding: EdgeInsets.only(top: 70),
                child: Container(
                  margin: EdgeInsets.only(left: 200, right: 200),
                  width: MediaQuery.of(context).size.width, // Make the input field full width
                  decoration: BoxDecoration(color: Colors.white), // Set background color of input field
                  child: TextFormField(
                    controller: _usernameController, // Link controller to manage text input
                    style: TextStyle(color: Colors.blue), // Set text color
                    decoration: InputDecoration(
                      fillColor: Colors.black12, // Set background color for the input area
                      hintText: "Username", // Placeholder text
                      hintStyle: TextStyle(
                        color: Colors.black, // Set placeholder text color
                      ),
                      border: InputBorder.none, // Remove default border
                      filled: true, // Enable background fill
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30), // Add space between input fields
              // This Container holds the input field for the email
              Container(
                child: Container(
                  margin: EdgeInsets.only(left: 200, right: 200),
                  width: MediaQuery.of(context).size.width, // Make the input field full width
                  decoration: BoxDecoration(color: Colors.white), // Set background color of input field
                  child: TextFormField(
                    controller: _emailController, // Link controller to manage text input
                    style: TextStyle(color: Colors.blue), // Set text color
                    decoration: InputDecoration(
                      fillColor: Colors.black12, // Set background color for the input area
                      hintText: "Email", // Placeholder text
                      hintStyle: TextStyle(
                        color: Colors.black, // Set placeholder text color
                      ),
                      border: InputBorder.none, // Remove default border
                      filled: true, // Enable background fill
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30), // Add space between input fields
              // This Container holds the input field for the password
              Container(
                child: Container(
                  margin: EdgeInsets.only(left: 200, right: 200),
                  width: MediaQuery.of(context).size.width, // Make the input field full width
                  decoration: BoxDecoration(color: Colors.white), // Set background color of input field
                  child: TextFormField(
                    controller: _passwordController, // Link controller to manage text input
                    style: TextStyle(color: Colors.blue), // Set text color
                    decoration: InputDecoration(
                      fillColor: Colors.black12, // Set background color for the input area
                      hintText: "Password", // Placeholder text
                      hintStyle: TextStyle(
                        color: Colors.black, // Set placeholder text color
                      ),
                      border: InputBorder.none, // Remove default border
                      filled: true, // Enable background fill
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40), // Add space before the signup button
              // This Container holds the signup button
              Container(
                margin: EdgeInsets.only(left: 200, right: 200),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), // Make the button rounded
                  color: Colors.blue, // Set background color of the button
                ),
                child: Center(
                  child: GestureDetector(
                    // Detects tap on the button to trigger signup logic
                    onTap: () async {
                      // Extract input values from the controllers
                      String username = _usernameController.text;
                      String email = _emailController.text;
                      String password = _passwordController.text;

                      // Call the signup method with the provided email and password
                      User? user = await _auth.SignupMethod(email, password);

                      // If signup is successful, navigate to HomePage
                      if (user != null) {
                        print("User is successfully created");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                        );
                      } else {
                        // Show an error message if signup fails
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Failed to create user. Please try again.")),
                        );
                      }
                    },
                    child: Text(
                      "SignUp..!", // Button text
                      style: TextStyle(
                        color: Colors.white, // Set text color
                        fontSize: 20, // Set font size
                        fontWeight: FontWeight.bold, // Make text bold
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30), // Add space before the login option
              // This Container provides an option to navigate to the login page
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                    children: [
                      Text(
                        "Already have an account", // Static text
                        style: TextStyle(
                          color: Colors.white, // Set text color
                          fontSize: 25, // Set font size
                          fontWeight: FontWeight.bold, // Make text bold
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to the login page when button is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => loginPage()),
                          );
                        },
                        child: Text(
                          "Login...!", // Button text
                          style: TextStyle(
                            color: Colors.blue, // Set text color
                            fontSize: 25, // Set font size
                            fontWeight: FontWeight.bold, // Make text bold
                          ),
                        ),
                      ),
                    ],
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
