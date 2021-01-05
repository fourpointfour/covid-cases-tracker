import 'package:covid_cases_tracker/decoration_parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DropdownStateSelector extends StatefulWidget {
  final List<String> stateCodes;
  // hardcoding stateCodes with their names
  final Map<String, String> stateName = {
    'AN': 'Andaman Nicobar',
    'AP': 'Andhra Pradesh',
    'AR': 'Arunachal Pradesh',
    'AS': 'Assam',
    'BR': 'Bihar',
    'CH': 'Chandigarh',
    'CT': 'Chhattisgarh',
    'DL': 'Delhi',
    'DN': 'Daman and Diu',
    'GA': 'Goa',
    'GJ': 'Gujrat',
    'HP': 'Himanchal Pradesh',
    'HR': 'Haryana',
    'JH': 'Jharkhand',
    'JK': 'Jammu and Kashmir',
    'KA': 'Karnataka',
    'KL': 'Kerala',
    'LA': 'Ladakh',
    'MH': 'Maharashtra',
    'ML': 'Meghalaya',
    'MN': 'Manipur',
    'MP': 'Madhya Pradesh',
    'MZ': 'Mizoram',
    'NL': 'Nagaland',
    'OR': 'Orrisa',
    'PB': 'Punjab',
    'PY': 'Puducherry',
    'RJ': 'Rajasthan',
    'SK': 'Sikkim',
    'TG': 'Telangana',
    'TN': 'Tamil Nadu',
    'TR': 'Tripura',
    'UP': 'Uttar Pradesh',
    'UT': 'Uttarakhand',
    'WB': 'West Bengal'
  };
  final data;

  DropdownStateSelector({this.stateCodes, this.data});

  @override
  _DropdownStateSelectorState createState() => _DropdownStateSelectorState();
}

class _DropdownStateSelectorState extends State<DropdownStateSelector> {
  var _selectedStateCode;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.fromLTRB(7, 2, 7, 2),
      child: Column(
        children: [
          DropdownButton(
            value: _selectedStateCode,
            dropdownColor: Colors.red[200],
            elevation: 20,
            underline: Container(),
            icon: Icon(Icons.arrow_downward_rounded),
            iconEnabledColor: Color(0xFFDF7861),
            hint: Text(
                "Select a state",
              style: TextStyle(
                color: Color(0xFFDF7861),
              ),
            ),
            items: widget.stateCodes.map((String stateCode){
              return DropdownMenuItem<String>(
                value: stateCode,
                child: Container(
                  width: 220,
                  child: Center(
                    child: Text(widget.stateName[stateCode]),
                  ),
                ),
              );
            }).toList(),
            onChanged: (val){
              setState(() {
                _selectedStateCode = val;
              });
            },
            selectedItemBuilder: (BuildContext context){
              return widget.stateCodes.map<Widget>((String stateCode){
                return Text(
                  widget.stateName[stateCode],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                );
              }).toList();
            },
          ),
          SizedBox(height: 15,),
          (_selectedStateCode == null) ? SizedBox() : Container(
            child: Column(
              children: [
                Container(
                  decoration: stateCaseTileParameter,
                  child: ListTile(
                    title: Text(
                      'Confirmed:',
                      style: stateTileTitleTextStyle,
                    ),
                    subtitle: Text(
                      '${widget.data[_selectedStateCode]['total']['confirmed']}',
                      style: stateTileSubtitleTextStyle,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: stateCaseTileParameter,
                  child: ListTile(
                    title: Text(
                      'Recovered:',
                      style: stateTileTitleTextStyle,
                    ),
                    subtitle: Text(
                      '${widget.data[_selectedStateCode]['total']['recovered']}',
                      style: stateTileSubtitleTextStyle,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: stateCaseTileParameter,
                  child: ListTile(
                    title: Text(
                      'Deceased:',
                      style: stateTileTitleTextStyle,
                    ),
                    subtitle: Text(
                      '${widget.data[_selectedStateCode]['total']['deceased']}',
                      style: stateTileSubtitleTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
