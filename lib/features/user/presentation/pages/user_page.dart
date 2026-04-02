import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_riverpod_clean_architecture_fast_dev/features/common/presentation/components/app_loader.dart';
import 'package:freezed_riverpod_clean_architecture_fast_dev/features/common/presentation/components/custom_loader.dart';

import '../../../common/presentation/components/app_icon.dart';
import '../provider/user_provider.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2️⃣ Watch the FutureProvider
    final usersAsync = ref.watch(userListProvider);

    return Scaffold(
      appBar: AppBar(
        title:  AppIcon.icon(Icons.arrow_back),
      ),
      body: usersAsync.when(
        loading: () => const Center(child: CustomLoader(color: Colors.deepPurple,size: 60,borderWidth: 90,)),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (users) {
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            },
          );
        },
      ),
    );
  }
}