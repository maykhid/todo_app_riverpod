import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_riverpod/app/features/task/data/model/task.dart';
import 'package:todo_app_riverpod/app/features/task/ui/controllers/task_controller.dart';
import 'package:todo_app_riverpod/app/shared/ui/app_button.dart';
import 'package:todo_app_riverpod/app/shared/ui/app_colors.dart';
import 'package:todo_app_riverpod/app/shared/ui/app_text_field.dart';
import 'package:todo_app_riverpod/app/shared/utils/sized_context.dart';

class EditTaskScreen extends ConsumerStatefulWidget {
  const EditTaskScreen({
    required this.taskProps,
    super.key,
  });

  final TaskProps taskProps;

  @override
  ConsumerState<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends ConsumerState<EditTaskScreen> {
  final TextEditingController _taskController = TextEditingController();

  late Task task;
  late int index;

  @override
  void initState() {
    task = widget.taskProps.task;
    index = widget.taskProps.index;
    _taskController.text = task.title;

    super.initState();
  }

  // void getAllTasks() async {
  //   final tasks = await context.read<HomeCubit>().getAllTasks();
  //   print(tasks);
  //   print(index);
  // }

  @override
  Widget build(BuildContext context) {
    // info.task = ref.read(taskControllerProvider).tasks[0];
    ref.listen(taskControllerProvider, (_, next) {
      if (next.asData?.hasValue ?? false) {
        context.pop();
      }
    });

    final taskController = ref.read(taskControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
        actions: [
          IconButton(
              onPressed: () => taskController.deleteTask(index),
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // task name
            const Text(
              'Task Name',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),

            const Gap(10),

            // task text field

            AppTextField(
              controller: _taskController,
            ),

            const Spacer(),

            AppButton(
              text: 'Done',
              width: context.width,
              isLoading: ref.watch(taskControllerProvider).isLoading,
              onPressed: () => taskController.updateTask(
                Task(title: _taskController.text, isDone: task.isDone),
                index,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class EditTaskInfo {
//   EditTaskInfo({required this.task, required this.index});

//   final Task task;
//   final int index;
// }

typedef TaskProps = ({Task task, int index});
