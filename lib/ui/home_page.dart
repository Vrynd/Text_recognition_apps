import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_recognition_app/controller/home_provider.dart';
import 'package:text_recognition_app/widget/image_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Text Recognition',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const _HomeBody(),
        ),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => context.read<HomeProvider>().openGallery(),
            child: Consumer<HomeProvider>(
              builder: (context, value, child) {
                final imagePath = value.imagePath;
                return ImageWidget(imagePath: imagePath);
              },
            ),
          ),
        ),
        Consumer<HomeProvider>(
          builder: (context, value, child) {
            return ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                  elevation: WidgetStatePropertyAll(1),
                  minimumSize: WidgetStateProperty.all<Size>(const Size(0, 50)),
                  mouseCursor: WidgetStatePropertyAll(MouseCursor.defer),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
              onPressed: value.imagePath == null
                  ? null
                  : () => value.goToResultPage(context),
              label: Text(
                "Analyze Text",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
              icon: Icon(
                size: 20,
                Icons.text_snippet,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            );
          },
        ),
      ],
    );
  }
}
