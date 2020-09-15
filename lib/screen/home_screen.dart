import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pro_work_tree_task/custom_widgts/loading_indicator_msg.dart';
import 'package:pro_work_tree_task/custom_widgts/platform_alert_box.dart';
import 'package:pro_work_tree_task/custom_widgts/platform_dialog.dart';
import 'package:pro_work_tree_task/models/user_data_model.dart';
import 'package:pro_work_tree_task/provider/auth_provider.dart';
import 'package:pro_work_tree_task/widget/loding.dart';
import 'package:pro_work_tree_task/widget/user_item_card_widgt.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getUserList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.waiting) {
            print('data : ${snapshot.data}');
            return ListView.separated(
                itemBuilder: (context, index) => UserItemCard(
                      userDataModel:
                          UserDataModel.fromMap(snapshot.data[index]),
                    ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: snapshot.data.length);
          }
          return Center(
            child: Loading(),
          );
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> getUserList() async {
    var response = await http.get(
      'https://reqres.in/api/users',
      headers: {
        'Accept': 'application/json',
      },
    );
    return List<Map<String, dynamic>>.from(jsonDecode(response.body)['data']);
  }
}
