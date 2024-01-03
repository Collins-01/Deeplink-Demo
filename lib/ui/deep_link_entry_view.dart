// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:deeplinking_demo/models/models.dart';

class DeepLinkEntryView extends StatefulWidget {
  final DeepLinkData data;
  const DeepLinkEntryView({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<DeepLinkEntryView> createState() => _DeepLinkEntryViewState();
}

class _DeepLinkEntryViewState extends State<DeepLinkEntryView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
