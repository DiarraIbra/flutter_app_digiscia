import 'package:flutter/material.dart';

// Nouvelle page d'accueil après connexion réussie
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Configuration de l'AppBar avec la couleur bleu Kente
      appBar: AppBar(
        title: const Text(
          'Page d\'accueil',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF0047AB), // Bleu Kente
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.3),
        // Bouton de déconnexion
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              // Retourner à la page de connexion
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),

      // Couleur de fond principale - Sable doré
      backgroundColor: const Color(0xFFD4AF6E),

      // Corps de la page avec défilement
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section Hero avec titre principal
            Container(
              padding: const EdgeInsets.all(25.0),
              margin: const EdgeInsets.only(bottom: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                'L\'Innovation Numérique Portée par 10 Experts Visionnaires',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0047AB), // Bleu Kente
                  fontFamily: 'Roboto',
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Section des trois cartes rectangulaires avec scroll horizontal
            Container(
              height: 120,
              margin: const EdgeInsets.only(bottom: 30.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  // Première carte
                  _buildInfoCard(
                    'Découvrez les talents qui façonnent l\'avenir numérique de l\'Afrique de l\'Ouest !',
                    const Color(0xFF0047AB),
                  ),
                  // Deuxième carte
                  _buildInfoCard(
                    'Notre application met en avant 10 experts IT de la zone AES, reconnus pour leur savoir-faire, leurs innovations et leur impact dans le secteur technologique.',
                    const Color(0xFF7B3F3B),
                  ),
                  // Troisième carte
                  _buildInfoCard(
                    'Explorez leurs parcours, leurs projets et leurs visions pour un continent plus connecté et innovant.',
                    const Color(0xFF0047AB),
                  ),
                ],
              ),
            ),

            // Titre pour la section des experts
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Nos Experts IT',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0047AB),
                  fontFamily: 'Roboto',
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Section des experts avec scroll horizontal
            Container(
              height: 150,
              margin: const EdgeInsets.only(bottom: 30.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  _buildExpertCard(
                    'OUEDRAOGO Alban',
                    'images/albanOuedraogo.jpeg',
                  ),
                  _buildExpertCard('YONLI Fidèle', 'images/Yonli.jpeg'),
                  _buildExpertCard('BAHAE Eddine ', 'images/bahae.jpeg'),
                  _buildExpertCard('TRAORE Souleymane', 'images/soul.jpeg'),
                  _buildExpertCard('ZANNOUTI Zineb', 'images/zoneb.jpeg'),
                  _buildExpertCard(
                    'GUINDO Souleymane',
                    'images/soulguind.jpeg',
                  ),
                  _buildExpertCard(
                    'OUATTARA Salifou',
                    'images/salifouattara.jpeg',
                  ),
                  _buildExpertCard(
                    'CISSE Mohamed ',
                    'images/mohamedbassirou.jpeg',
                  ),
                  _buildExpertCard('Abdoul Kader', 'images/abdoulkader.jpeg'),
                  _buildExpertCard('KID Chris', 'images/chris.jpeg'),
                ],
              ),
            ),

            // Bouton d'appel à l'action
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  // Redirection vers la page de liste des experts
                  Navigator.pushNamed(context, '/experts_list');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0047AB), // Bleu Kente
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 6,
                  shadowColor: Colors.black.withOpacity(0.3),
                ),
                child: const Text(
                  'Cliquez ici pour en savoir plus',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),

            // Espacement en bas pour éviter que le contenu soit masqué par la barre de navigation
            const SizedBox(height: 80),
          ],
        ),
      ),

      // Barre de navigation inférieure
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF0047AB), // Bleu Kente
          unselectedItemColor: const Color(0xFF7B3F3B), // Terre cuite
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 11,
          ),
          elevation: 8,
          currentIndex: 0, // Index de l'onglet Accueil sélectionné
          onTap: (index) {
            // Gérer la navigation selon l'index sélectionné
            switch (index) {
              case 0:
                // Déjà sur Accueil
                break;
              case 1:
                // Navigation vers Liste des experts
                Navigator.pushNamed(context, '/experts_list');
                break;
              case 2:
                // Navigation vers Contact
                Navigator.pushNamed(context, '/contact');
                break;
              case 3:
                // Navigation vers Chat
                Navigator.pushNamed(context, '/chat');
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 26),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt, size: 26),
              label: 'Liste des experts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone, size: 26),
              label: 'Contact',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble, size: 26),
              label: 'Chat',
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour créer les cartes d'information rectangulaires
  Widget _buildInfoCard(String text, Color backgroundColor) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 15.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: backgroundColor.withOpacity(0.3), width: 2),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: backgroundColor,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          height: 1.3,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  // Widget pour créer les cartes d'experts
  Widget _buildExpertCard(String name, String imagePath) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image de l'expert (remplacée par un avatar par défaut)
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
              border: Border.all(color: const Color(0xFF0047AB), width: 2),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 10),
          // Nom de l'expert
          Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF7B3F3B),
              fontFamily: 'Roboto',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
