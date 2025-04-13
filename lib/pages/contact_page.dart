import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'univshop76@gmail.com',
      queryParameters: {'subject': 'Question sur UNIVSHOP'},
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw "Impossible d'ouvrir l'email";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Support UNIVSHOP"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue[800],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo_univshop.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.headset_mic, size: 40, color: Colors.white),
                      SizedBox(height: 10),
                      Text(
                        "Nous sommes là pour vous",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "7j/7 • 9h-20h • Réponse sous 24h",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Contact Options
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildContactCard(
                    icon: Icons.email,
                    color: Colors.blue,
                    title: "Email",
                    subtitle: "univshop76@gmail.com",
                    action: _launchEmail,
                  ),

                  const SizedBox(height: 16),
                  _buildContactCard(
                    icon: Icons.phone,
                    color: Colors.green,
                    title: "Téléphone",
                    subtitle: "+229 0146077268",
                    action: () => launchUrl(Uri.parse("tel:+2290146077268")),
                  ),

                  const SizedBox(height: 16),
                  _buildContactCard(
                    icon: Icons.location_on,
                    color: Colors.orange,
                    title: "Siège Social",
                    subtitle: "Bénin, Abomey",
                    action: () => launchUrl(Uri.parse("https://maps.app.goo.gl/gJ89V6ira94knPGG7")),
                  ),

                  const SizedBox(height: 30),
                  const Text(
                    "Ou visitez notre centre d'aide en ligne",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () => launchUrl(Uri.parse("https://help.univshop.com")),
                    child: const Text("Centre d'aide UNIVSHOP"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required Function() action,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: action,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}