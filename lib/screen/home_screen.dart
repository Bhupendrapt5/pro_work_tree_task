import 'package:flutter/material.dart';
import 'package:pro_work_tree_task/custom_widgts/loading_indicator_msg.dart';
import 'package:pro_work_tree_task/custom_widgts/platform_alert_box.dart';
import 'package:pro_work_tree_task/custom_widgts/platform_dialog.dart';
import 'package:pro_work_tree_task/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String pageName = '/home_screen';
  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Home'), actions: [
        IconButton(
          tooltip: 'Logout',
          icon: Icon(
            Icons.power_settings_new,
          ),
          onPressed: () async {
            var signOut = await PlatFormAlertDialogBox(
              title: 'Logout',
              content: 'Do you want Logout?',
              defaultActionText: 'Logout',
              cancelActionText: 'No',
            ).show(context);

            if (signOut) {
              // ignore: unawaited_futures
              PlatFormDialogBox(
                content: LoadingIndicatorWithMessage(text: 'Loggign Out'),
              ).show(context);
              await _authProvider.logout(context);
            }
          },
        ),
      ]),
    );
  }
}
