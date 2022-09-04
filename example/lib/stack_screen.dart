import 'package:flutter/material.dart';
import 'package:calendar_agenda/calendar_agenda.dart';

class StackScreen extends StatefulWidget {
  const StackScreen({Key? key}) : super(key: key);

  @override
  State<StackScreen> createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();
  late DateTime _selectedDateAppBBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 175,
            child: SizedBox(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(

                itemCount: 40,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text("$index"),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: CalendarAgenda(
              controller: _calendarAgendaControllerAppBar,
              appbar: true,
              selectedDayPosition: SelectedDayPosition.right,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              weekDay: WeekDay.long,
              fullCalendarScroll: FullCalendarScroll.horizontal,
              fullCalendarDay: WeekDay.long,
              selectedDateColor: Colors.green.shade900,
              dateColor: Colors.black,
              currentDateColor: Colors.black,
              locale: 'en',
              initialDate: DateTime.now(),
              calendarEventColor: Colors.green,
              firstDate: DateTime.now().subtract(Duration(days: 140)),
              lastDate: DateTime.now().add(Duration(days: 60)),
              onDateSelected: (date) {
                setState(() {
                  _selectedDateAppBBar = date;
                });
              },
            ),
          ),

        ],
      ),
    );
  }
}
