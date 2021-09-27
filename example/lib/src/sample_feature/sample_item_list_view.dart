import 'package:darlight_example/src/settings/settings_controller.dart';
import 'package:darlight_example/src/settings/settings_service.dart';
import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';
import 'package:dark_light_button/dark_light_button.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    Key? key,
    required this.controller,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  }) : super(key: key);

  static const routeName = '/';

  final List<SampleItem> items;
  final SettingsController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          DarlightButton(
            type: Darlights.DarlightFour,
            height: 30,
            options: DarlightFourOption(
              lightIconColor: Colors.red,
              darkIconColor: Colors.white
            ),
            onChange: (ThemeMode theme) {
              controller.updateThemeMode(theme);
            },
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text('SampleItem ${item.id}'),
              leading: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                Navigator.restorablePushNamed(
                  context,
                  SampleItemDetailsView.routeName,
                );
              });
        },
      ),
    );
  }
}
