import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_riverpod/app/features/task/data/model/task.dart';
import 'package:todo_app_riverpod/app/features/task/ui/controllers/task_controller.dart';
import 'package:todo_app_riverpod/app/shared/ui/app_button.dart';
import 'package:todo_app_riverpod/app/shared/ui/app_text_field.dart';
import 'package:todo_app_riverpod/app/shared/utils/sized_context.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key});

  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final TextEditingController _taskTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(taskControllerProvider, (_, next) {
      // print(next.isLoading);
      if (next.asData!.hasValue) {
        context.pop();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Gap(20),

            // task name
            const Text('Task Name'),

            const Gap(10),

            // task text field
            AppTextField(
              controller: _taskTextController,
            ),

            const Spacer(),

            AppButton(
              text: 'Done',
              width: context.width,
              isLoading: ref.watch(taskControllerProvider).isLoading,
              onPressed: () {
                ref.read(taskControllerProvider.notifier).writeTask(
                    Task(title: _taskTextController.text, isDone: false));

                print(_taskTextController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
