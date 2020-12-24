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
      child: DropdownButton(
        value: _selectedStateCode,
        elevation: 20,
        underline: Container(),
        icon: Icon(Icons.arrow_drop_down_rounded),
        iconEnabledColor: Colors.white,
        hint: Text(
            "Select a state",
          style: TextStyle(
            color: Colors.white,
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
        },
        // todo: Fix selectedItemBuilder issue
        // selectedItemBuilder: (BuildContext context) {
        //   return widget.stateCodes.map<Widget>((String stateCode){
        //     return ExpansionTile(
        //       title: Text(
        //         widget.stateName[stateCode],
        //         style: TextStyle(
        //           color: Colors.white70,
        //           fontWeight: FontWeight.bold,
        //           fontSize: 25,
        //         ),
        //       ),
        //       children: [
        //         Column(
        //           children: [
        //             Text("Confirmed: ${widget.data[stateCode]['total']['confirmed'] ?? 0}"),
        //             SizedBox(height: 5),
        //             Text("Recovered: ${widget.data[stateCode]['total']['recovered'] ?? 0}"),
        //             SizedBox(height: 5),
        //             Text("Deceased: ${widget.data[stateCode]['total']['deceased'] ?? 0}"),
        //           ],
        //         ),
        //       ],
        //     );
        //   }).toList();
        // },
      ),
    );
  }
}
