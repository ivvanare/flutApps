import 'package:flutter/material.dart';

class ItemStepKyc extends StatelessWidget {
  const ItemStepKyc({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    required this.onTap,
    this.active = false,
  });

  final String title, subtitle;
  final IconData leadingIcon;
  final void Function()? onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: active ? Colors.green : Colors.black12,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          color: Colors.white,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Icon(
              leadingIcon,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: Icon(
            Icons.check_circle,
            color: active ? Colors.green : Colors.black12,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
