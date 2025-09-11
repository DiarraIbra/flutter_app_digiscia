import 'package:flutter/material.dart';
import 'custom_bottom_navbar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _emailController = TextEditingController();
  final _objetController = TextEditingController();
  final _messageController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nomController.dispose();
    _emailController.dispose();
    _objetController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nous Contacter",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFF0047AB),
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.3),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFD4AF6E),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // En-tête avec icône et message d'accueil
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white.withOpacity(0.9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0047AB).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.mail_outline,
                          size: 40,
                          color: Color(0xFF0047AB),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Restons en Contact !",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0047AB),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Une question, une idée ou un projet à partager ?\n'
                        'Remplissez le formulaire ci-dessous ou utilisez nos coordonnées pour entrer en contact avec nous.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF7B3F3B),
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),

                // Formulaire de contact
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Formulaire de Contact",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0047AB),
                        ),
                      ),
                      const SizedBox(height: 20),

                      _buildTextField(
                        "Nom complet *",
                        Icons.person_outline,
                        _nomController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre nom complet';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      _buildTextField(
                        "Adresse email *",
                        Icons.email_outlined,
                        _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre email';
                          }
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return 'Veuillez entrer un email valide';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      _buildTextField(
                        "Objet du message *",
                        Icons.subject_outlined,
                        _objetController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer l\'objet du message';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      _buildTextField(
                        "Votre message *",
                        Icons.message_outlined,
                        _messageController,
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre message';
                          }
                          if (value.length < 10) {
                            return 'Le message doit contenir au moins 10 caractères';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 24),

                      // Bouton d'envoi avec gradient
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF0047AB), Color(0xFF003580)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF0047AB).withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _sendMessage();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.send, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                "Envoyer le Message",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Séparateur
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.white.withOpacity(0.5)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "OU",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.white.withOpacity(0.5)),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Coordonnées directes
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.contact_phone,
                            color: Color(0xFF0047AB),
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Coordonnées Directes",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0047AB),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      _buildContactItem(
                        Icons.email,
                        "ibrahimadiarraibou@gmail.com",
                      ),
                      const SizedBox(height: 12),
                      _buildContactItem(Icons.phone, "+212 612892969"),
                      const SizedBox(height: 12),
                      _buildContactItem(Icons.location_on, "Marrakech, Maroc"),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }

  Widget _buildTextField(
    String hint,
    IconData icon,
    TextEditingController controller, {
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
        prefixIcon: Icon(icon, color: const Color(0xFF0047AB)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF0047AB), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF0047AB).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFF0047AB), size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF7B3F3B),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  void _sendMessage() {
    // Animation de succès
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 16),
            const Text(
              "Message Envoyé !",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0047AB),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Merci pour votre message. Nous vous répondrons dans les plus brefs délais.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF7B3F3B), fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _clearForm();
            },
            child: const Text(
              "OK",
              style: TextStyle(
                color: Color(0xFF0047AB),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _clearForm() {
    _nomController.clear();
    _emailController.clear();
    _objetController.clear();
    _messageController.clear();
  }
}
