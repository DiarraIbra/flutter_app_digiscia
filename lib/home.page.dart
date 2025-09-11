import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFD4AF6E,
      ), // Couleur de fond dorée comme la page des experts
      appBar: AppBar(
        title: const Text("Connexion", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(
          0xFF0047AB,
        ), // Bleu royal comme la page des experts
        elevation: 4,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                child: Card(
                  elevation:
                      6, // Ombre plus marquée comme dans la page des experts
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      16,
                    ), // Coins arrondis comme la page des experts
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Image(
                            image: AssetImage("images/test.jpeg"),
                            height: 180,
                            width: 180,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Titre de connexion avec style des experts
                        Text(
                          "CONNEXION",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0047AB),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 2,
                          width: 80,
                          color: const Color(0xFF0047AB),
                        ),
                        const SizedBox(height: 24),

                        // Champ nom d'utilisateur avec le style des experts
                        TextFormField(
                          controller: loginController,
                          decoration: InputDecoration(
                            hintText: "Nom d'utilisateur",
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xFF0047AB),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // Coins arrondis comme la barre de recherche
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFF0047AB),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFF0047AB),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Champ mot de passe avec le style des experts
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Mot de passe",
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xFF0047AB),
                            ),
                            suffixIcon: const Icon(
                              Icons.visibility,
                              color: Color(0xFF7B3F3B),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFF0047AB),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFF0047AB),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Bouton de connexion avec le style des experts
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              String username = loginController.text;
                              String password = passwordController.text;
                              if (username == "admin" && password == "1234") {
                                Navigator.of(
                                  context,
                                ).pushReplacementNamed('/welcome');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(
                                0xFF0047AB,
                              ), // Couleur bleue des experts
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                            child: const Text(
                              "Se connecter",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Texte d'aide avec style discret
                        Text(
                          "admin / 1234",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
