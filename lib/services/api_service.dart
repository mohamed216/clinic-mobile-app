import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Change this to your API URL
  static const String baseUrl = 'https://your-domain.com/api';
  
  static String? _token;

  // Set token after login
  static void setToken(String token) {
    _token = token;
  }

  // Clear token on logout
  static void clearToken() {
    _token = null;
  }

  // Headers with token
  static Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    if (_token != null) 'Authorization': 'Bearer $_token',
  };

  // ==================== AUTH ====================
  
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: headers,
      body: jsonEncode({'email': email, 'password': password}),
    );
    
    final data = _handleResponse(response);
    if (data['token'] != null) {
      setToken(data['token']);
    }
    return data;
  }

  static Future<Map<String, dynamic>> register(
    String name, 
    String email, 
    String password,
    String passwordConfirmation,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: headers,
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      }),
    );
    
    final data = _handleResponse(response);
    if (data['token'] != null) {
      setToken(data['token']);
    }
    return data;
  }

  static Future<void> logout() async {
    await http.post(
      Uri.parse('$baseUrl/logout'),
      headers: headers,
    );
    clearToken();
  }

  // ==================== PATIENTS ====================

  static Future<Map<String, dynamic>> getPatients({String? search}) async {
    final queryParams = search != null ? '?search=$search' : '';
    final response = await http.get(
      Uri.parse('$baseUrl/patients$queryParams'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> getPatient(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/patients/$id'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> createPatient(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/patients'),
      headers: headers,
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> updatePatient(int id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/patients/$id'),
      headers: headers,
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  static Future<void> deletePatient(int id) async {
    await http.delete(
      Uri.parse('$baseUrl/patients/$id'),
      headers: headers,
    );
  }

  // ==================== DOCTORS ====================

  static Future<Map<String, dynamic>> getDoctors({String? search}) async {
    final queryParams = search != null ? '?search=$search' : '';
    final response = await http.get(
      Uri.parse('$baseUrl/doctors$queryParams'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> getDoctor(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/doctors/$id'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  // ==================== APPOINTMENTS ====================

  static Future<Map<String, dynamic>> getAppointments({String? status, String? date}) async {
    var queryParams = <String>[];
    if (status != null) queryParams.add('status=$status');
    if (date != null) queryParams.add('date=$date');
    
    final query = queryParams.isNotEmpty ? '?${queryParams.join('&')}' : '';
    final response = await http.get(
      Uri.parse('$baseUrl/appointments$query'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> createAppointment(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/appointments'),
      headers: headers,
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> updateAppointment(int id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/appointments/$id'),
      headers: headers,
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  // ==================== INVOICES ====================

  static Future<Map<String, dynamic>> getInvoices({String? status}) async {
    final query = status != null ? '?status=$status' : '';
    final response = await http.get(
      Uri.parse('$baseUrl/invoices$query'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> createInvoice(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/invoices'),
      headers: headers,
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  // ==================== DASHBOARD ====================

  static Future<Map<String, dynamic>> getDashboardStats() async {
    final response = await http.get(
      Uri.parse('$baseUrl/dashboard/stats'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  // ==================== HELPER ====================

  static dynamic _handleResponse(http.Response response) {
    final data = jsonDecode(response.body);
    
    switch (response.statusCode) {
      case 200:
      case 201:
        return data;
      case 400:
        throw Exception(data['message'] ?? 'Bad Request');
      case 401:
        clearToken();
        throw Exception(data['message'] ?? 'Unauthorized');
      case 404:
        throw Exception(data['message'] ?? 'Not Found');
      case 500:
        throw Exception(data['message'] ?? 'Server Error');
      default:
        throw Exception(data['message'] ?? 'Error: ${response.statusCode}');
    }
  }
}
