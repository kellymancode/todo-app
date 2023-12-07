import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slightly_tech/constants/colors.dart';
import 'package:slightly_tech/models/note.dart';
import 'package:slightly_tech/screens/edit.dart';
import 'package:slightly_tech/widgets/button_widget.dart';
import 'package:slightly_tech/widgets/custom_appBar.dart';
import 'package:slightly_tech/widgets/note_card_widget.dart';
import 'package:slightly_tech/widgets/text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SlightlyTechieNoteModel> filteredNotes = [];
  bool sorted = false;

  @override
  void initState() {
    super.initState();
    filteredNotes = sampleNotes;
  }

  List<SlightlyTechieNoteModel> sortNotesByModifiedTime(List<SlightlyTechieNoteModel> notes) {
    if (sorted) {
      notes.sort((a, b) => a.modifiedTime!.compareTo(b.modifiedTime!));
    } else {
      notes.sort((b, a) => a.modifiedTime!.compareTo(b.modifiedTime!));
    }

    sorted = !sorted;

    return notes;
  }

  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  void onSearchTextChanged(String searchText) {
    setState(() {
      filteredNotes = sampleNotes
          .where((note) =>
              note.content!.toLowerCase().contains(searchText.toLowerCase()) ||
              note.title!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void deleteNote(int index) {
    setState(() {
      SlightlyTechieNoteModel note = filteredNotes[index];
      sampleNotes.remove(note);
      filteredNotes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            CustomAppBar(
              onPressed: (){
                setState(() {
                filteredNotes = sortNotesByModifiedTime(filteredNotes);
              });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              onChanged: onSearchTextChanged,
            ),
            const SizedBox(height: 20,),
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.only(top: 30),
              itemCount: filteredNotes.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return NoteCard(
                  index: index, 
                  color: getRandomColor(), 
                  trailing: IconButton(
                  onPressed: () async {
                    final result = await confirmDialog(context);
                    if (result != null && result) {
                      deleteNote(index);
                    }
                  },
                  icon: const Icon(
                    CupertinoIcons.delete,
                  ),
                ),
                  filteredNotes: filteredNotes,
                  onPressed: () async{
                     final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            EditScreen(note: filteredNotes[index]),
                      ),
                    );
                    if (result != null) {
                      setState(() {
                        int originalIndex =
                            sampleNotes.indexOf(filteredNotes[index]);

                        sampleNotes[originalIndex] = SlightlyTechieNoteModel(
                            id: sampleNotes[originalIndex].id,
                            title: result[0],
                            content: result[1],
                            modifiedTime: DateTime.now());
                            
                        filteredNotes[index] = SlightlyTechieNoteModel(
                            id: filteredNotes[index].id,
                            title: result[0],
                            content: result[1],
                            modifiedTime: DateTime.now());
                      });
                    }
                  },
                  );
                },
            ),
          )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const EditScreen(),
            ),
          );

          if (result != null) {
            setState(() {
              sampleNotes.add(SlightlyTechieNoteModel(
                  id: sampleNotes.length,
                  title: result[0],
                  content: result[1],
                  modifiedTime: DateTime.now()));
              filteredNotes = sampleNotes;
            });
          }
        },
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: const Icon(
          Icons.add,
          size: 38,
        ),
      ),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey.shade900,
            icon: const Icon(
              Icons.info,
              color: Colors.grey,
            ),
            title: const Text(
              'Are you sure you want to delete?',
              style: TextStyle(color: Colors.white),
            ),
            content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const AppButton(text: Text(
                    "Yes",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),),
                    AppButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      text: const Text(
                    "No",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),),
                ]),
          );
        });
  }
}
