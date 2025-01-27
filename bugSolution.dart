```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    // Handle SocketException specifically (e.g., no internet)
    throw Exception('No internet connection: $e');
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    throw Exception('Invalid JSON format: $e');
  } on Exception catch (e) {
    // Catch other exceptions
    print('An unexpected error occurred: $e'); // Log the error for debugging
    rethrow; // Re-throw to allow higher-level handling
  }
}

void main() async {
  try {
    final data = await fetchData();
    print('Data fetched successfully: $data');
  } catch (e) {
    print('An error occurred: $e');
    // Implement appropriate user feedback or retry mechanism here
  }
}
```