```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success, process the JSON response
      final jsonData = jsonDecode(response.body);
      // ... process jsonData ...
    } else {
      // Handle error
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Catch any exception during the network request or JSON decoding
    print('Error fetching data: $e');
    // Re-throw the exception to be handled by the caller
    rethrow;
  }
}

void main() async {
  try {
    await fetchData();
    print('Data fetched successfully!');
  } catch (e) {
    print('An error occurred: $e');
  }
}
```