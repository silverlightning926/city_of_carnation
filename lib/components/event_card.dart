import 'package:cached_network_image/cached_network_image.dart';
import 'package:city_of_carnation/screens/event_screen.dart';
import 'package:city_of_carnation/serialized/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Ink(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: const ColorFilter.mode(
              Color.fromARGB(188, 0, 0, 0),
              BlendMode.darken,
            ),
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              event.image!,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EventScreen(
                  event: event,
                ),
              ),
            );
          },
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        event.title!,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        event.locationName!,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        DateFormat.yMMMMd().format(
                          event.startingTimestamp!.toDate().toLocal(),
                        ),
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
