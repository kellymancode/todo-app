import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slightly_tech/models/note.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, 
  required this.index, 
  required this.filteredNotes, 
  required this.color,
  required this.onPressed,
  required this.trailing,
  });
  final int index;
  final Color color;
  final List<SlightlyTechieNoteModel> filteredNotes;
  final void Function()? onPressed;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return 
    Card(
      margin: const EdgeInsets.only(bottom: 20),
      color: color,
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          onTap: onPressed,
          title: RichText(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text: '${filteredNotes[index].title} \n',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    height: 1.5),
                children: [
                  TextSpan(
                    text: filteredNotes[index].content,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        height: 1.5),
                  )
                ]),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Edited: ${DateFormat('EEE MMM d, yyyy h:mm a').format(filteredNotes[index].modifiedTime ?? DateTime.now())}',
              style: TextStyle(
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade800),
            ),
          ),
          trailing: trailing
        ),
      ),
    );
                      
  }
}