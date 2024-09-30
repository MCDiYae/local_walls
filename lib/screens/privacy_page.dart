import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            '''
          Effective Date: 30/09/2024

We at sunset wallpaper value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, and safeguard your information when you use our wallpaper app.

Information We Collect
No Personal Data Collection
sunset wallpaper does not collect, store, or share any personal data from users. The app is designed solely to allow users to set wallpapers on their devices. We do not collect any information about you or your usage of the app.

Permissions We Request
To provide a smooth experience, our app requests the following permissions:

Storage Access (Read and Write External Storage)
We request access to your device's external storage to allow you to browse and set wallpapers. This permission is used solely for reading and saving images from your device to set as wallpapers. We do not access or collect any other files or information from your device.
Set Wallpaper
The app requires this permission to set wallpapers on your device. This action only applies to the images you select within the app, and no data is collected or shared as part of this process.

Internet Access
Our app requires internet access to download and update wallpaper content. This is solely for providing fresh content, and we do not collect any data while connecting to the internet.

Third-party Services
No Third-party Data Sharing
[Your App Name] does not share any user data with third-party services, except for services related to serving advertisements (if applicable). We may integrate third-party services such as:

Google AdMob
If ads are displayed in the app, Google AdMob may collect some data to provide personalized ads. You can review Google’s privacy policy for more information on how your data is managed.
Security
Since our app does not collect personal information, we do not store any user data. Therefore, no sensitive data is at risk of being compromised.

Changes to This Privacy Policy
We may update our Privacy Policy from time to time. Any changes will be posted on this page with the updated date. You are advised to review this Privacy Policy periodically for any changes.

Contact Us
If you have any questions or concerns about this Privacy Policy or how your data is handled in [Your App Name], feel free to contact us at:

clientbondhl@outlook.com
+447457409057
https://sites.google.com/view/clientbondhl/ 
          ''',
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
