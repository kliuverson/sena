import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String apiKey = 'TU_API_KEY_AQUI';

  Future<String> sendMessage(String prompt) async {
    final url = Uri.parse('https://api.openai.com/v1/chat/completions');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        "model": "gpt-4o", 
        "messages": [
          {"role": "user", "content": prompt}
        ],
        "temperature": 0.7,
        "max_tokens": 200,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'].toString().trim();
    } else {
      throw Exception('Error: ${response.statusCode} ${response.body}');
    }
  }
}
