import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/payment_data.dart';

class ChartData {
  static Future<List<PaymentData>> getChartData(String year) async {
    try {
      final String response = await rootBundle.loadString('assets/payment_data.json');

      final Map<String, dynamic> jsonData = jsonDecode(response);

      if (!jsonData.containsKey(year)) {
        throw ArgumentError("Year not found in data");
      }
      final List<dynamic> yearData = jsonData[year];
      return yearData.map((item) => PaymentData.fromJson(item)).toList();
    } catch (e) {
      throw Exception("Error reading or parsing payment data: $e");
    }
  }
  
}
