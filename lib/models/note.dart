class SlightlyTechieNoteModel {
  int? id;
  String? title;
  String? content;
  DateTime? modifiedTime;

  SlightlyTechieNoteModel({
    this.id,
    this.title,
    this.content,
    this.modifiedTime,
  });
}


List<SlightlyTechieNoteModel> sampleNotes = [
  SlightlyTechieNoteModel(
    id: 0,
    title: 'Work Progress',
    content:
        'aksjfha asldj asjdh',
    modifiedTime: DateTime(2022,1,1,34,5),
  ),
  SlightlyTechieNoteModel(
    id: 1,
    title: 'Where can I get some?',
    content:
        'It is a long established fact that a reader will be distracted by the readable content',
    modifiedTime: DateTime(2022,1,1,34,5),
  ),
  SlightlyTechieNoteModel(
    id: 2,
    title: 'Why do we use it?',
    content:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been',
    modifiedTime: DateTime(2023,3,1,19,5),
  ),
  SlightlyTechieNoteModel(
    id: 3,
    title: 'Where does it come from?',
    content: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin',
   modifiedTime: DateTime(2023,1,4,16,53),
  ),
  SlightlyTechieNoteModel(
    id: 4,
    title: 'Text Plan',
    content:
        'randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing',
    modifiedTime: DateTime(2023,5,1,11,6),
  ),
  SlightlyTechieNoteModel(
    id: 5,
    title: 'Lessons',
    content:
        'ada',
   modifiedTime: DateTime(2023,1,6,13,9),
  ),
    SlightlyTechieNoteModel(
    id: 6,
    title: 'Test 3',
    content: "Working fine",
   modifiedTime: DateTime(2023,3,7,11,12),
  ),
  SlightlyTechieNoteModel(
    id: 7,
    title: 'Joining SlightlyTechie',
    content:
        'Maybe soon',
    modifiedTime: DateTime(2023,2,1,15,14),
  ),
  SlightlyTechieNoteModel(
    id: 8,
    title: 'Worked on this sunday',
    content:
        '',
    modifiedTime: DateTime(2023,2,1,12,34),
  ),
];
