import 'package:flutter/material.dart';

class Posts {
  final String eventTitle;
  final String location;
  final DateTime timestamp;

  Posts({
    required this.eventTitle,
    required this.location,
    required this.timestamp,
  });
}

class PostsPage extends StatelessWidget {
  final List<Posts> events = [
    Posts(
      eventTitle: "Tech Conference",
      location: "13th Street, Park Avenue",
      timestamp: DateTime(2024, 11, 30, 9, 00),
    ),
    Posts(
      eventTitle: "Leadership Seminar",
      location: "13th Street, Park Avenue",
      timestamp: DateTime(2024, 1, 28, 14, 00),
    ),
    Posts(
      eventTitle: "Entrepreneurship Summit",
      location: "13th Street, Park Avenue",
      timestamp: DateTime(2025, 3, 15, 10, 00),
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
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return PostsTile(event: event, formatDateTime: formatDateTime);
          },
        ),
      ),
    );
  }
}

class PostsTile extends StatelessWidget {
  final Posts event;
  final String Function(DateTime) formatDateTime;

  const PostsTile({
    Key? key,
    required this.event,
    required this.formatDateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/event_photo.png",
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.eventTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          event.location,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 4),
                        Text(
                          formatDateTime(event.timestamp),
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
