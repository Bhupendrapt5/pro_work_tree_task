import 'package:flutter/material.dart';
import 'package:pro_work_tree_task/models/user_data_model.dart';
import 'package:transparent_image/transparent_image.dart';

class UserItemCard extends StatelessWidget {
  final UserDataModel userDataModel;

  const UserItemCard({Key key, this.userDataModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: userDataModel.avatar,
        ),
      ),
      title: Text('${userDataModel.firstName} ${userDataModel.lastName}'),
      subtitle: Text('${userDataModel.email}'),
    );
  }
}
