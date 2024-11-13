import 'package:flutter/material.dart';
import '../providers/prayertimes_provider.dart';
import '../widgets/prayertime_widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prayer Times')),
      body: Consumer<PrayerTimeProvider>(
        builder: (context, provider, child) {
          final prayerTimes = provider.prayerTimes;

          if (prayerTimes == null) {
            provider
                .fetchPrayerTimes();
            return const Center(
                child: CircularProgressIndicator());
          }else {
            return ListView.separated(
              itemBuilder: (context, index) {
                final prayerName = prayerTimes.data.keys;
                final prayerTime = prayerTimes.data.values;



                return PrayerTimeCard(
                  prayerName: prayerName.elementAt(index),
                  prayerTime: prayerTime.elementAt(index),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: prayerTimes.data.length,
            );
          }
        },
      ),
    );
  }
}