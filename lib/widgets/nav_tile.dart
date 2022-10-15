import 'package:flutter/cupertino.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';

class NavTile extends StatelessWidget {
  final String title;
  final IconData icon;

  final VoidCallback onPressed;

  NavTile(this.title, this.icon, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
      title: Text(
        title,
        style: CupertinoTheme.of(context).textTheme.textStyle,
      ),
      onTap: onPressed,
    );
  }
}
