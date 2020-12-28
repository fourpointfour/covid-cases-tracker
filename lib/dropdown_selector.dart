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
            elevation: 20,
            underline: Container(),
            icon: Icon(Icons.arrow_drop_down_rounded),
            iconEnabledColor: Colors.white,
            hint: Text(
                "Select a state",
              style: TextStyle(
                color: Color(0xFFECB390),
              ),
            ),
            // itemHeight: 18,
            items: widget.stateCodes.map((String stateCode){
              return DropdownMenuItem<String>(
                value: stateCode,
                child: Text(widget.stateName[stateCode]),
              );
            }).toList(),
            onChanged: (val){
              setState(() {
                _selectedStateCode = val;
              });
            }
          ),
          (_selectedStateCode == null) ? SizedBox() : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ]
            ),
            child: ExpansionTile(
              title: Text(
                widget.stateName[_selectedStateCode],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Confirmed: ${widget.data[_selectedStateCode]['total']['confirmed']}"),
                SizedBox(height: 5,),
                Text("Recovered: ${widget.data[_selectedStateCode]['total']['recovered']}"),
                SizedBox(height: 5,),
                Text("Deceased: ${widget.data[_selectedStateCode]['total']['deceased']}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
