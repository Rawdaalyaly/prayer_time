import 'package:flutter/material.dart';

import '../Models/prayertime_models.dart';
import '../services/prayertime_servicees.dart';

class PrayerTimeProvider with ChangeNotifier {
  PrayerTimeModel? prayerTimes;
  Future<void> fetchPrayerTimes() async {
    prayerTimes = await PrayerTimeService.getPrayerTimes();
    notifyListeners();
  }
}