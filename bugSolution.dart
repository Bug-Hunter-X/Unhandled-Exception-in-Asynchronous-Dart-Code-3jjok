```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonResponse = jsonDecode(response.body);
      // Do something with the data
    } else {
      // Handle non-200 status codes more gracefully
      throw Exception('Failed to load data: ${response.statusCode} - ${response.reasonPhrase}');
    }
  } on FormatException catch (e) {
    // Handle JSON decoding errors specifically
    print('JSON decoding error: $e');
  } on SocketException catch (e) {
    // Handle network errors specifically
    print('Network error: $e');
  } catch (e) {
    // Handle other exceptions 
    print('An unexpected error occurred: $e');
  } finally {
    // Code to be executed regardless of success or failure
    print('Data fetching complete');
  }
}
```