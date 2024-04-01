import 'package:bookly/core/functions/launch_url.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomButton(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          text: '19.99€',
          fontWeight: FontWeight.bold,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        CustomButton(
          onPressed: () async {
            launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
          },
          backgroundColor: const Color(0xffEF8262),
          textColor: Colors.white,
          text: 'Free Preview',
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ],
    );
  }
}
