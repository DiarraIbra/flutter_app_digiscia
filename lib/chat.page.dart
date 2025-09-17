import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  ChatPage({super.key});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  List<dynamic> data = [
    {'message': 'Hello', 'type': 'user'},
    {'message': 'How can i help you', 'type': 'assistant'},
    {'message': 'Give me information about you', 'type': 'user'},
    {'message': 'I am a helpful assistant', 'type': 'assistant'},
  ];

  TextEditingController queryController = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Assistant IA",
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
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              setState(() {
                data = [
                  {'message': 'Hello', 'type': 'user'},
                  {'message': 'How can i help you', 'type': 'assistant'},
                  {'message': 'Give me information about you', 'type': 'user'},
                  {'message': 'I am a helpful assistant', 'type': 'assistant'},
                ];
              });
            },
            tooltip: "Nouvelle conversation",
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F7FA),
      body: Column(
        children: [
          // Header avec compteur de messages
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF0047AB).withOpacity(0.1),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0047AB).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.chat_bubble_outline,
                        size: 16,
                        color: Color(0xFF0047AB),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "${data.length} messages",
                        style: const TextStyle(
                          color: Color(0xFF0047AB),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (isLoading)
                  const Row(
                    children: [
                      SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF0047AB),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "En cours...",
                        style: TextStyle(
                          color: Color(0xFF0047AB),
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),

          // Zone de chat
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              itemCount: data.length,
              itemBuilder: (context, index) {
                bool isUser = data[index]['type'] == 'user';
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: isUser
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isUser) ...[
                        // Avatar assistant
                        Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.only(right: 8, top: 4),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF0047AB), Color(0xFF003580)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF0047AB).withOpacity(0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.smart_toy,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],

                      // Bulle de message
                      Flexible(
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.75,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            gradient: isUser
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF0047AB),
                                      Color(0xFF003580),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null,
                            color: isUser ? null : Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(16),
                              topRight: const Radius.circular(16),
                              bottomLeft: Radius.circular(isUser ? 16 : 4),
                              bottomRight: Radius.circular(isUser ? 4 : 16),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: isUser
                                    ? const Color(0xFF0047AB).withOpacity(0.3)
                                    : Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            data[index]['message'],
                            style: TextStyle(
                              color: isUser
                                  ? Colors.white
                                  : const Color(0xFF2D3748),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ),

                      if (isUser) ...[
                        // Avatar utilisateur
                        Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.only(left: 8, top: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD4AF6E),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFD4AF6E).withOpacity(0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),

          // Zone de saisie
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F9FA),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: const Color(0xFFE2E8F0),
                          width: 1,
                        ),
                      ),
                      child: TextFormField(
                        controller: queryController,
                        enabled: !isLoading,
                        maxLines: null,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          hintText: "Tapez votre message...",
                          hintStyle: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 15,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Bouton d'envoi
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0047AB), Color(0xFF003580)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0047AB).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(24),
                        onTap: isLoading || queryController.text.trim().isEmpty
                            ? null
                            : () async {
                                String query = queryController.text;

                                setState(() {
                                  data.add({'message': query, 'type': 'user'});
                                  isLoading = true;
                                  queryController.clear();
                                });

                                // Auto-scroll après ajout du message utilisateur
                                WidgetsBinding.instance.addPostFrameCallback((
                                  _,
                                ) {
                                  if (scrollController.hasClients) {
                                    scrollController.animateTo(
                                      scrollController.position.maxScrollExtent,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeOut,
                                    );
                                  }
                                });

                                try {
                                  const String apiKey =
                                      "your_api_key_here"; // Remplacez par votre clé API

                                  final url = Uri.parse(
                                    "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=$apiKey",
                                  );

                                  final headers = {
                                    -"Content-Type": "application/json",
                                  };

                                  final body = json.encode({
                                    "contents": [
                                      {
                                        "parts": [
                                          {"text": query},
                                        ],
                                      },
                                    ],
                                  });

                                  print("Sending request to: $url");
                                  print("Request body: $body");

                                  final response = await http
                                      .post(url, headers: headers, body: body)
                                      .timeout(const Duration(seconds: 30));

                                  print(
                                    "Response status: ${response.statusCode}",
                                  );
                                  print("Response body: ${response.body}");

                                  if (response.statusCode == 200) {
                                    final result = json.decode(response.body);

                                    if (result['candidates'] != null &&
                                        result['candidates'].isNotEmpty &&
                                        result['candidates'][0]['content'] !=
                                            null &&
                                        result['candidates'][0]['content']['parts'] !=
                                            null &&
                                        result['candidates'][0]['content']['parts']
                                            .isNotEmpty) {
                                      String assistantMessage =
                                          result['candidates'][0]['content']['parts'][0]['text'];

                                      setState(() {
                                        data.add({
                                          "message": assistantMessage,
                                          "type": "assistant",
                                        });
                                        isLoading = false;
                                      });
                                    } else {
                                      // Réponse vide ou format incorrect
                                      setState(() {
                                        data.add({
                                          "message":
                                              "Désolé, je n'ai pas pu générer une réponse. Veuillez réessayer.",
                                          "type": "assistant",
                                        });
                                        isLoading = false;
                                      });
                                    }
                                  } else {
                                    // Erreur HTTP
                                    final errorBody = json.decode(
                                      response.body,
                                    );
                                    String errorMessage =
                                        "Erreur ${response.statusCode}";

                                    if (errorBody['error'] != null &&
                                        errorBody['error']['message'] != null) {
                                      errorMessage +=
                                          ": ${errorBody['error']['message']}";
                                    }

                                    setState(() {
                                      data.add({
                                        "message": "Erreur: $errorMessage",
                                        "type": "assistant",
                                      });
                                      isLoading = false;
                                    });
                                  }
                                } catch (error) {
                                  print("Exception caught: $error");
                                  setState(() {
                                    data.add({
                                      "message": "Erreur de connexion: $error",
                                      "type": "assistant",
                                    });
                                    isLoading = false;
                                  });
                                }

                                // Auto-scroll après la réponse
                                WidgetsBinding.instance.addPostFrameCallback((
                                  _,
                                ) {
                                  if (scrollController.hasClients) {
                                    scrollController.animateTo(
                                      scrollController.position.maxScrollExtent,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeOut,
                                    );
                                  }
                                });
                              },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: Icon(
                            isLoading
                                ? Icons.hourglass_empty
                                : Icons.send_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
