import 'package:flutter/material.dart';

class Comment {
  final String eventTitle;
  final String comment;
  final DateTime timestamp;

  Comment({
    required this.eventTitle,
    required this.comment,
    required this.timestamp,
  });
}

class CommentsPage extends StatelessWidget {
  final List<Comment> comments = [
    Comment(
      eventTitle: "Flutter Flash",
      comment: "Looks like an amazing event!",
      timestamp: DateTime(2024, 11, 30, 23, 00),
    ),
    Comment(
      eventTitle: "Bob’s annual BBQ",
      comment: "Wish I could’ve been there:(",
      timestamp: DateTime(2024, 8, 2, 22, 31),
    ),
    Comment(
      eventTitle: "Networking Lounge",
      comment: "Will the event be starting on time?",
      timestamp: DateTime(2023, 6, 25, 0, 0),
    ),
  ];

  String formatDateTime(DateTime dateTime) {
    return "${dateTime.day} ${_getMonthName(dateTime.month)} ${dateTime.year}, "
        "${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')} ${dateTime.hour < 12 ? 'AM' : 'PM'}";
  }

  String _getMonthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, index) {
            final comment = comments[index];
            return Column(
              children: [
                CommentTile(comment: comment, formatDateTime: formatDateTime),
                Divider(
                    indent: 26,
                    endIndent: 26,
                    thickness: 1,
                    color: Colors.grey),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CommentTile extends StatelessWidget {
  final Comment comment;
  final String Function(DateTime) formatDateTime;

  const CommentTile({
    Key? key,
    required this.comment,
    required this.formatDateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        title: Text(
          comment.eventTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('"${comment.comment}"'),
            SizedBox(height: 4),
            Text(
              formatDateTime(comment.timestamp),
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      ),
    );
  }
}
