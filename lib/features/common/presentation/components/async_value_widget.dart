import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_loader.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T data) data;

  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => const Center(child: AppLoader()),
      error: (e, _) => Center(child: Text(e.toString())),
    );
  }

}

// AsyncValueWidget(
// value: ref.watch(userProvider),
// data: (users) {
// return ListView.builder(
// itemCount: users.length,
// itemBuilder: (_, i) {
// final user = users[i];
//
// return AppCard(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// AppText(user.name, size: 16, weight: FontWeight.bold),
// AppSpacing.h8,
// AppText(user.email),
// ],
// ),
// );
// },
// );
// },
// )

