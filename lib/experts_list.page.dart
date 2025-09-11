import 'package:flutter/material.dart';
import 'package:flutter_project_digiscia/contact.page.dart';
import 'custom_bottom_navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class Expert {
  final int id;
  final String nom;
  final String specialite;
  final String imageUrl;
  final bool isTop;
  final String linkedinUrl;
  final String description;
  final List<String> competences;
  final String experience;
  final String formation;
  final List<String> certifications;

  Expert({
    required this.id,
    required this.nom,
    required this.specialite,
    required this.imageUrl,
    this.isTop = false,
    this.linkedinUrl = '',
    this.description = '',
    this.competences = const [],
    this.experience = '',
    this.formation = '',
    this.certifications = const [],
  });
}

class ExpertsListPage extends StatefulWidget {
  const ExpertsListPage({super.key});

  @override
  State<ExpertsListPage> createState() => _ExpertsListPageState();
}

class _ExpertsListPageState extends State<ExpertsListPage> {
  final List<Expert> experts = [
    Expert(
      id: 1,
      nom: "OUEDRAOGO Alban",
      specialite:
          "Full Stack Developer (Java-Spring, React JS, Node JS, Angular, Flutter)",
      imageUrl: "images/albanOuedraogo.jpeg",
      isTop: true,
      linkedinUrl: "https://www.linkedin.com/in/alban-wende-ouedraogo/",
      description:
          "Développeur Full Stack expérimenté avec une expertise approfondie dans les technologies Java-Spring, React JS, Node JS, Angular et Flutter. Passionné par la création d'applications web et mobiles performantes et scalables.",
      competences: [
        "• Développement Full Stack : Java-Spring, React JS, Node JS",
        "• Développement mobile avec Flutter",
        "• Framework Angular pour applications web dynamiques",
        "• Architecture et conception de solutions robustes",
        "• Intégration API et services web",
      ],
      experience: "5+ années en développement Full Stack",
      formation: "Ingénieur en Informatique",
      certifications: [
        "Oracle Certified Java Developer",
        "React Professional Certificate",
        "Flutter Development Specialist",
      ],
    ),
    Expert(
      id: 2,
      nom: "YONLI Fidèle",
      specialite:
          "Full Stack Web Developer | Data/AI/ML Engineer | 10000codeurs Ambassador",
      imageUrl: "images/Yonli.jpeg",
      isTop: true,
      linkedinUrl: "https://www.linkedin.com/in/yonlifidele/",
      description:
          "Passionné par l'Intelligence Artificielle et l'Ingénierie des Données, YONLI Fidèle accompagne les organisations dans la conception de solutions data et IA robustes, performantes et scalables. Son expertise couvre tout le cycle de vie de la donnée : de l'ingestion à sa valorisation via le Machine Learning, le Deep Learning et les modèles génératifs.",
      competences: [
        "• Ingénierie des données : Apache Spark, Kafka, Hadoop, Airflow, Azure Data Factory, ETL/ELT",
        "• Bases de données : SQL (PostgreSQL, MySQL), NoSQL (MongoDB, Cassandra, Redis)",
        "• Machine Learning & Deep Learning : Scikit-learn, TensorFlow, PyTorch, NLP (spaCy, Transformers, Hugging Face), Computer Vision (OpenCV, CNN)",
        "• Cloud & Big Data : Azure, AWS, Google Cloud, Databricks",
        "• Déploiement & DevOps : FastAPI, Django, REST API, microservices, Docker, Kubernetes, CI/CD, GitHub Actions",
        "• Data Quality & Governance : RGPD, data lineage, monitoring, validation",
        "• Développement Web : React.js, FastAPI, Django avec une sensibilité UX/UI",
      ],
      experience: "6+ années en Data Engineering et développement",
      formation: "Master en Data Science et Intelligence Artificielle",
      certifications: [
        "Azure Data Engineer Associate",
        "AWS Machine Learning Specialty",
        "Google Cloud Professional Data Engineer",
      ],
    ),
    Expert(
      id: 3,
      nom: "BAHAE Eddine Halim",
      specialite:
          "Co-founder & CTO of XAI | Sr. Data Scientist | AI Advocate | PhD Candidate in Reinforcement Learning & Game Theory | MDS | MRN | MFF",
      imageUrl: "images/bahae.jpeg",
      linkedinUrl: "https://www.linkedin.com/in/halimbahae/",
      description:
          "Spécialiste en Intelligence Artificielle, Data Science et Game Theory, BAHAE Eddine Halim aide les organisations à aligner innovation technologique et stratégie d'entreprise. Son expertise couvre le Machine Learning avancé, le Reinforcement Learning et la Transformation Digitale pour créer un impact mesurable et durable.",
      competences: [
        "• Intelligence Artificielle & Data Science : Reinforcement Learning, Game Theory, modèles prédictifs",
        "• Transformation Digitale & Innovation : alignement stratégique et exécution",
        "• Analyse de données et prise de décision basée sur l'IA",
        "• Développement de solutions technologiques adaptées aux besoins business",
        "• Leadership technique et encadrement d'équipes",
      ],
      experience: "8+ années en IA et Data Science",
      formation: "PhD Candidate in Reinforcement Learning & Game Theory",
      certifications: [
        "Advanced Machine Learning Specialist",
        "Reinforcement Learning Expert",
        "AI Strategy and Leadership",
      ],
    ),
    Expert(
      id: 4,
      nom: "Zannouti Zineb",
      specialite:
          "Generative AI Engineer | VA Tech Team Lead @Cnexia | DialogFlow CX",
      imageUrl: "images/zoneb.jpeg",
      linkedinUrl: "https://www.linkedin.com/in/zineb-zannouti-a62a19152/",
      description:
          "Ingénieur en IA Générative et Team Lead spécialisée dans le développement d'assistants virtuels et de solutions conversationnelles. Expertise avancée en DialogFlow CX et technologies d'IA générative pour créer des expériences utilisateur intelligentes et naturelles.",
      competences: [
        "• Intelligence Artificielle Générative et NLP",
        "• Développement d'assistants virtuels avec DialogFlow CX",
        "• Leadership technique et gestion d'équipes",
        "• Architecture de solutions conversationnelles",
        "• Intégration de modèles de langage avancés",
        "• Programmation : Python, JavaScript, Cloud platforms",
      ],
      experience: "6+ années en IA et développement",
      formation: "Master en Intelligence Artificielle",
      certifications: [
        "Google Cloud DialogFlow CX Expert",
        "Generative AI Professional",
        "Team Leadership Certification",
      ],
    ),
    Expert(
      id: 5,
      nom: "GUINDO Souleymane",
      specialite: "Software Engineer",
      imageUrl: "images/soulguind.jpeg",
      linkedinUrl: "https://www.linkedin.com/in/souleymane-guindo-734207141/",
      description:
          "GUINDO Souleymane est un ingénieur logiciel passionné avec plus de cinq ans d'expérience en développement web, mobile et backend, désormais en expansion vers le DevOps, l'IA et la R&D. Adaptable et curieux, il mène les projets de l'idéation au déploiement avec efficacité.",
      competences: [
        "• Développement web full-stack et applications mobiles",
        "• Architecture backend et microservices",
        "• DevOps et automatisation des déploiements",
        "• Intelligence Artificielle et Machine Learning",
        "• Recherche et Développement technologique",
        "• Gestion de projets et coordination d'équipes",
      ],
      experience: "5+ années d'expérience",
      formation: "Ingénieur en Génie Logiciel",
      certifications: [
        "AWS Solutions Architect",
        "Docker & Kubernetes Certified",
        "Agile Project Management",
      ],
    ),
    Expert(
      id: 6,
      nom: "CISSE Mohamed Bassirou",
      specialite: "IT Engineer | Full-Stack Developer",
      imageUrl: "images/mohamedbassirou.jpeg",
      linkedinUrl: "https://www.linkedin.com/in/mohamedbassiroucisse/",
      description:
          "CISSE Mohamed Bassirou est titulaire d'un diplôme de maîtrise en Méthodes Informatiques Appliquées à la Gestion des Entreprises, dynamique et passionné par les nouvelles technologies. Il possède des compétences variées en analyse, conception et réalisation de systèmes d'information.",
      competences: [
        "• Analyse, conception et réalisation des systèmes d'information",
        "• Développement logiciel full-stack",
        "• Installation et administration des systèmes d'exploitation",
        "• Solutions de communication en temps réel",
        "• Gestion de bases de données",
        "• Optimisation des processus métier",
      ],
      experience: "4+ années en développement et systèmes",
      formation:
          "Maîtrise en Méthodes Informatiques Appliquées à la Gestion des Entreprises",
      certifications: [
        "Microsoft Azure Fundamentals",
        "Full-Stack Web Development",
        "Database Administration",
      ],
    ),
    Expert(
      id: 7,
      nom: "TAPSOBA Abdoul Kader",
      specialite: "Data scientist and Ingénieur logiciel",
      imageUrl: "images/abdoulkader.jpeg",
      linkedinUrl:
          "https://www.linkedin.com/in/abdoul-kader-tapsoba-32b193196/",
      description:
          "TAPSOBA Abdoul Kader est un data scientist et ingénieur logiciel expérimenté spécialisé dans la transformation numérique des entreprises. Il conçoit des infrastructures de données sécurisées et évolutives pour optimiser les performances métier.",
      competences: [
        "• Data Science et analyse de données complexes",
        "• Développement logiciel et architecture de solutions",
        "• Machine Learning et modélisation prédictive",
        "• Transformation digitale et optimisation des processus",
        "• Infrastructures de données sécurisées et évolutives",
        "• Business Intelligence et tableaux de bord",
      ],
      experience: "9+ années d'expérience",
      formation: "Master en Data Science et Génie Logiciel",
      certifications: [
        "Data Scientist Professional",
        "Python for Data Science",
        "Machine Learning Specialist",
      ],
    ),
    Expert(
      id: 8,
      nom: "KID Chris",
      specialite: "Passionate Developer | Data Scientist | Project Manager",
      imageUrl: "images/chris.jpeg",
      isTop: true,
      linkedinUrl: "https://www.linkedin.com/in/chriskid/",
      description:
          "KID Chris est un développeur passionné et orienté résultats, possédant une expertise en Deep Learning, Machine Learning et Génie Électronique. Il allie polyvalence, gestion efficace des tâches et communication pour créer des solutions innovantes et robustes.",
      competences: [
        "• Deep Learning et réseaux de neurones avancés",
        "• Machine Learning et intelligence artificielle",
        "• Génie Électronique appliqué à la data et aux systèmes intelligents",
        "• Développement web avec Total.js et technologies modernes",
        "• Gestion de projets et communication efficace",
        "• Freelancing en Data Science et projets innovants",
      ],
      experience: "7+ années en développement et Data Science",
      formation: "Open Degree avec focus sur Deep Learning et Machine Learning",
      certifications: [
        "Deep Learning Specialization",
        "TensorFlow Developer Certificate",
        "Project Management Professional (PMP)",
      ],
    ),
    Expert(
      id: 9,
      nom: "TRAORE Souleymane",
      specialite: "Ingénieur IA/Data Science&Software En Formation",
      imageUrl: "images/soul.jpeg",
      linkedinUrl: "https://www.linkedin.com/in/souleymane-traore-0778aa28a/",
      description:
          "TRAORE Souleymane est élève ingénieur en IA/Data Science à ENSAM Meknès, très dynamique et motivé, passionné par l'application des nouvelles technologies et de l'IA/ML pour accroître la productivité industrielle. Il développe également des compétences en développement web avec des technologies actuelles.",
      competences: [
        "• Intelligence Artificielle et Machine Learning appliqués à l'industrie",
        "• Développement web avec technologies modernes (React, Node.js)",
        "• Analyse de données et modélisation statistique",
        "• Optimisation des processus industriels par l'IA",
        "• Réalisation de projets académiques et personnels en équipe",
        "• Capacité à apprendre et à s'adapter rapidement aux besoins industriels",
      ],
      experience: "2+ années de projets académiques et stages",
      formation: "Élève ingénieur en IA/Data Science à ENSAM Meknès",
      certifications: [
        "Machine Learning Foundation",
        "Python Programming Certificate",
        "Web Development Fundamentals",
      ],
    ),
    Expert(
      id: 10,
      nom: "OUATTARA Salifou",
      specialite:
          "Spécialiste IT | Chef de projet digitalisation | Cybersécurité | Gouvernance numérique | Transformation digitale | Secteur public & institutions financières régionales.",
      imageUrl: "images/salifouattara.jpeg",
      linkedinUrl: "https://www.linkedin.com/in/salifou-ouattara/",
      description:
          "OUATTARA Salifou est un professionnel des systèmes d'information et de la transformation digitale, avec plus de 15 ans d'expérience en pilotage de projets technologiques, gouvernance numérique et cybersécurité dans des contextes multinationaux. Il souhaite contribuer à l'innovation numérique au service du développement au sein d'institutions régionales.",
      competences: [
        "• Pilotage de projets technologiques complexes",
        "• Gouvernance numérique et politiques IT",
        "• Cybersécurité et gestion des risques",
        "• Transformation digitale des organisations",
        "• Expérience dans des contextes multinationaux",
        "• Management d'équipes IT et conduite du changement",
        "• Secteur public et institutions financières",
      ],
      experience: "15+ années d'expérience",
      formation: "Master en Systèmes d'Information et Cybersécurité",
      certifications: [
        "CISSP (Certified Information Systems Security Professional)",
        "PMP (Project Management Professional)",
        "ITIL Foundation",
        "ISO 27001 Lead Auditor",
      ],
    ),
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    List<Expert> filteredExperts = experts
        .where(
          (expert) =>
              expert.nom.toLowerCase().contains(searchQuery.toLowerCase()) ||
              expert.specialite.toLowerCase().contains(
                searchQuery.toLowerCase(),
              ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Liste des experts",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0047AB),
        elevation: 4,
      ),
      backgroundColor: const Color(0xFFD4AF6E),
      body: Column(
        children: [
          // Barre de recherche
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Rechercher un expert...",
                prefixIcon: const Icon(Icons.search, color: Color(0xFF0047AB)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: filteredExperts.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final expert = filteredExperts[index];
                return _buildExpertCard(expert);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildExpertCard(Expert expert) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color(0xFF0047AB),
                backgroundImage: expert.imageUrl.isNotEmpty
                    ? AssetImage(expert.imageUrl)
                    : null,
                child: expert.imageUrl.isEmpty
                    ? const Icon(Icons.person, size: 30, color: Colors.white)
                    : null,
              ),
              const SizedBox(width: 12),
              // Infos
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expert.nom,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0047AB),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      expert.specialite,
                      style: const TextStyle(
                        color: Color(0xFF7B3F3B),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              // Bouton "Voir plus"
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  _navigateToExpertDetails(expert);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0047AB),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  "Voir plus",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToExpertDetails(Expert expert) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExpertDetailsPage(expert: expert),
      ),
    );
  }
}

// Page de détails de l'expert
class ExpertDetailsPage extends StatelessWidget {
  final Expert expert;

  const ExpertDetailsPage({super.key, required this.expert});

  Future<void> _launchLinkedIn() async {
    if (expert.linkedinUrl.isNotEmpty) {
      final Uri url = Uri.parse(expert.linkedinUrl);
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch ${expert.linkedinUrl}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0047AB),
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFD4AF6E),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section description avec logo DigiScia
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          expert.description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        // Logo DigiScia
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0047AB),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'images/img.jpeg',
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                "DigiScia",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Nom de l'expert avec séparateur
                  Center(
                    child: Column(
                      children: [
                        Text(
                          expert.nom.toUpperCase(),
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
                          width: 100,
                          color: const Color(0xFF0047AB),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Photo de profil et informations
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Photo de profil
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: const Color(0xFF0047AB),
                        backgroundImage: expert.imageUrl.isNotEmpty
                            ? AssetImage(expert.imageUrl)
                            : null,
                        child: expert.imageUrl.isEmpty
                            ? const Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.white,
                              )
                            : null,
                      ),

                      const SizedBox(width: 16),

                      // Informations détaillées
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Spécialité
                            _buildInfoSection(
                              "Spécialité :",
                              expert.specialite,
                            ),

                            const SizedBox(height: 16),

                            // Compétences & Expertise Clés
                            _buildInfoSection(
                              "Compétences & Expertise Clés :",
                              expert.competences.join('\n'),
                            ),

                            const SizedBox(height: 16),

                            // Expérience
                            _buildInfoSection(
                              "Expérience :",
                              expert.experience,
                            ),

                            const SizedBox(height: 16),

                            // Formation
                            _buildInfoSection("Formation :", expert.formation),

                            const SizedBox(height: 16),

                            // Certifications
                            _buildInfoSection(
                              "Certifications :",
                              expert.certifications.join('\n'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Badge TOP si applicable
                  if (expert.isTop)
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "EXPERT TOP",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),

                  const SizedBox(height: 32),

                  // Boutons d'action
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContactPage(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.message),
                          label: const Text("Contacter"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0047AB),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _launchLinkedIn,
                          icon: const Icon(Icons.person_outline),
                          label: const Text("Profil"),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF0047AB),
                            side: const BorderSide(color: Color(0xFF0047AB)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0047AB),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF7B3F3B),
            height: 1.3,
          ),
        ),
      ],
    );
  }
}
