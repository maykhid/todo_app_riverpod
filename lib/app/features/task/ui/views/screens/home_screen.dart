import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_riverpod/app/features/task/ui/controllers/task_controller.dart';
import 'package:todo_app_riverpod/app/features/task/ui/views/widgets/task_tile.dart';
import 'package:todo_app_riverpod/app/shared/ui/app_colors.dart';
import 'package:todo_app_riverpod/app/shared/ui/app_images.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final authCubit = context.read<AuthenticationCubit>();

    final taskState = ref.watch(taskControllerProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 123,
        title: const Padding(
          padding: EdgeInsets.only(left: 8, right: 8, bottom: 20),
          child: Row(
            children: [
              // profi;e pic
              CircleAvatar(
                child: Icon(Icons.verified_user),
              ),

              Gap(10),

              // user info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello, Henry'),
                  Text(
                    'henryifebunandu@gmail.com',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w100,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/addTask'),
        backgroundColor: AppColors.lightBlue,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AdWidget(),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: switch (taskState) {
                  AsyncData(:final value) => value.tasks.isEmpty
                      ? const Message(
                          message:
                              'You have no Tasks yet, click the FAB to add new tasks',
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TaskTile(
                              index: index,
                            ),
                          ),
                          // separatorBuilder: (context, index) => const Gap(10),
                          itemCount: value.tasks.length,
                        ),
                  AsyncError() =>
                    const Text('Oops, something unexpected happened'),
                  _ => const CircularProgressIndicator(),
                }

                // taskState.tasks.isEmpty
                //     ? const Message(
                //         message:
                //             'You have no Tasks yet, click the FAB to add new tasks',
                //       )
                //     : ListView.builder(
                //         shrinkWrap: true,
                //         itemBuilder: (context, index) => Padding(
                //           padding: const EdgeInsets.only(top: 15),
                //           child: TaskTile(
                //             index: index,
                //           ),
                //         ),
                //         // separatorBuilder: (context, index) => const Gap(10),
                //         itemCount: taskState.tasks.length,
                //       ),
                // ref.(
                //   //error
                //   error: (message) => Message(message: message.errorMessage),

                //   // loaded
                //   loaded: (response) {
                //     final tasks = response.tasks.tasks;

                //     if (tasks.isEmpty) {
                //       return const Message(
                //         message:
                //             'You have no Tasks yet, click the FAB to add new tasks',
                //       );
                //     }

                //     return ListView.builder(
                //       shrinkWrap: true,
                //       itemBuilder: (context, index) => Padding(
                //         padding: const EdgeInsets.only(top: 15),
                //         child: TaskTile(
                //           task: tasks[index],
                //           index: index,
                //         ),
                //       ),
                //       // separatorBuilder: (context, index) => const Gap(10),
                //       itemCount: tasks.length,
                //     );
                //   },
                //   orElse: () {
                //     return Container();
                //   },
                // ),
                ),
          ],
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    required this.message,
    super.key,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Gap(200),
        Text(message),
      ],
    );
  }
}

class AdWidget extends StatelessWidget {
  const AdWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      decoration: BoxDecoration(
        color: AppColors.lime,
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(AppImages.trophy),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Go Pro (No Ads)'),
              Text('No fuss, no ads, for only \$1 a \nmonth'),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 66,
              height: 71,
              color: AppColors.darkBlue,
              child: const Center(
                child: Text(
                  r'$1',
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
