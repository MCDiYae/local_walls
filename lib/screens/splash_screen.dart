import 'package:flutter/material.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'TERMS OF USE',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'We are informing you about the app that gives you many services and important information for safer and efficient use.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'By pressing the Accept button, I declare I have read and accepted the following condition of use:',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            _buildTermItem(Icons.info_outline,
                'By pressing the Accept button, I declare I have read and accepted the following condition of use:'),
            _buildTermItem(Icons.block,
                'If we find the app is being used outside its terms of use, we may restrict access to it.'),
            _buildTermItem(Icons.build,
                'Any type of modification to the app or its components is not allowed.'),
            _buildTermItem(Icons.privacy_tip,
                'Privacy Policy may be updated from time to time for any reason. We will notify you of any changes to our Privacy Policy by posting the new Privacy Policy here.'),
            _buildTermItem(Icons.security,
                'We do not share any kind of your Personal Data with third parties'),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                // Navigate to the home page
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Accept'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
