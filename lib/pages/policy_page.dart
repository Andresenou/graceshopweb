import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'contact_page.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

  Future<void> _generateAndSavePDF(BuildContext context) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(
                level: 0,
                child: pw.Row(
                  children: [
                    pw.Text(
                      "Charte UNIVSHOP",
                      style: pw.TextStyle(
                        fontSize: 24,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),
              _buildPDFSection(
                title: "1. Notre Philosophie",
                content: """
UNIVSHOP est une plateforme de vente en ligne généraliste, conçue pour faciliter les échanges entre acheteurs et vendeurs à l'échelle locale et internationale. Notre ambition est d'offrir une alternative simple, accessible et sécurisée.

Nos piliers :
• Design intuitif pour une prise en main immédiate
• Frais de commission réduits (5-8%)
• Support réactif sans bureaucratie
""",
              ),
              _buildPDFSection(
                title: "2. Engagements Vendeurs",
                content: """
• Transparence absolue : descriptions précises, frais affichés
• Tolérance zéro pour contrefaçon/produits illicites
• Flexibilité tarifaire sous contrôle qualité
• Outils analytiques intégrés
""",
              ),
              _buildPDFSection(
                title: "3. Protection Acheteurs",
                content: """
• Paiements sécurisés avec cryptage bancaire
• Garantie "14 jours satisfait ou remboursé"
• Système de notation vérifiée
• Livraison suivie en temps réel
""",
              ),
              _buildPDFSection(
                title: "4. Sécurité des Données",
                content: """
• Conformité RGPD/CCPA stricte
• Aucune revente à des tiers
• Chiffrement AES-256
• Suppression des données sur demande
""",
              ),
              _buildPDFSection(
                title: "5. Nos Différenciateurs",
                content: """
• Focus marchés niche : artisans locaux, B2B
• Multilingue (FR/EN/ES) et multi-devises
• Programme de parrainage récompensé
• Événements commerciaux virtuels exclusifs
""",
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (format) => pdf.save(),
    );
  }

  pw.Widget _buildPDFSection({required String title, required String content}) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 8),
        pw.Text(content),
        pw.SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/logo_univshop.png', height: 30),
            const SizedBox(width: 10),
            const Text(
              "Charte UNIVSHOP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blue),
        titleTextStyle: const TextStyle(
          color: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFE8F4F8)],
            stops: [0.1, 0.9],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section 1: Positionnement
              _buildSection(
                icon: Icons.rocket_launch,
                title: "1. Notre Philosophie",
                content: """
                UNIVSHOP est une plateforme de vente en ligne généraliste, conçue pour faciliter les échanges entre acheteurs et vendeurs à l'échelle locale et internationale. Notre ambition est d'offrir une alternative simple, accessible et sécurisée.
                
                Nos piliers :
                • Design intuitif pour une prise en main immédiate
                • Frais de commission réduits (5-8%)
                • Support réactif sans bureaucratie
                """,
              ),

              // Section 2: Règles Vendeurs
              _buildSection(
                icon: Icons.store,
                title: "2. Engagements Vendeurs",
                content: """
                • Transparence absolue : descriptions précises, frais affichés
                • Tolérance zéro pour contrefaçon/produits illicites
                • Flexibilité tarifaire sous contrôle qualité
                • Outils analytiques intégrés
                """,
              ),

              // Section 3: Protection Acheteurs
              _buildSection(
                icon: Icons.shopping_bag,
                title: "3. Protection Acheteurs",
                content: """
                • Paiements sécurisés avec cryptage bancaire
                • Garantie "14 jours satisfait ou remboursé"
                • Système de notation vérifiée
                • Livraison suivie en temps réel
                """,
              ),

              // Section 4: Données
              _buildSection(
                icon: Icons.security,
                title: "4. Sécurité des Données",
                content: """
                • Conformité RGPD/CCPA stricte
                • Aucune revente à des tiers
                • Chiffrement AES-256
                • Suppression des données sur demande
                """,
              ),

              // Section 5: Atouts UNIVSHOP
              _buildSection(
                icon: Icons.star,
                title: "5. Nos Différenciateurs",
                content: """
                • Focus marchés niche : artisans locaux, B2B
                • Multilingue (FR/EN/ES) et multi-devises
                • Programme de parrainage récompensé
                • Événements commerciaux virtuels exclusifs
                """,
              ),

              // Bouton PDF
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.picture_as_pdf, size: 24),
                    label: const Text(
                      "Télécharger la Charte Complète",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () => _generateAndSavePDF(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ContactPage()),
        ),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        elevation: 4,
        child: const Icon(Icons.mail_outline, size: 28),
      ),
    );
  }

  Widget _buildSection(
      {required IconData icon, required String title, required String content}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: Colors.blue[700], size: 24),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                content,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}