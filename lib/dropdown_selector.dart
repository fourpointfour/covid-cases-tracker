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
            },
            selectedItemBuilder: (BuildContext context){
              return widget.stateCodes.map<Widget>((String stateCode){
                return Text(
                  widget.stateName[stateCode],
                  style: TextStyle(
                    // fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList();
            },
          ),
          (_selectedStateCode == null) ? SizedBox() : Container(
            child: Column(
              children: [
                Container(
                  decoration: stateCaseTileParameter,
                  child: ListTile(
                    title: Text(
                      'Confirmed: ${widget.data[_selectedStateCode]['total']['confirmed']}',
                      style: stateTileTitleTextStyle,
                    ),
                    subtitle: (widget.data[_selectedStateCode].containsKey('delta')) ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (widget.data[_selectedStateCode]['delta'].containsKey('confirmed')) ? [
                        // icon to indicate rise and fall
                        Icon(
                            (widget.data[_selectedStateCode]['delta']['confirmed'] < 0) ?
                            Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
                          size: 15,
                        ),
                        Text(
                            '${widget.data[_selectedStateCode]['delta']['confirmed']}',
                          style: stateTileSubtitleTextStyle,
                        ),
                      ] : [],
                    ) : SizedBox(),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: stateCaseTileParameter,
                  child: ListTile(
                    title: Text(
                      'Recovered: ${widget.data[_selectedStateCode]['total']['recovered']}',
                      style: stateTileTitleTextStyle,
                    ),
                    subtitle: (widget.data[_selectedStateCode].containsKey('delta')) ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (widget.data[_selectedStateCode]['delta'].containsKey('recovered')) ? [
                        // icon to indicate rise and fall
                        Icon(
                          (widget.data[_selectedStateCode]['delta']['recovered'] < 0) ?
                          Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
                          size: 15,
                        ),
                        Text(
                          '${widget.data[_selectedStateCode]['delta']['recovered']}',
                          style: stateTileSubtitleTextStyle,
                        ),
                      ] : [],
                    ) : SizedBox(),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: stateCaseTileParameter,
                  child: ListTile(
                    title: Text(
                      'Deceased: ${widget.data[_selectedStateCode]['total']['deceased']}',
                      style: stateTileTitleTextStyle,
                    ),
                    subtitle: (widget.data[_selectedStateCode].containsKey('delta')) ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (widget.data[_selectedStateCode]['delta'].containsKey('deceased')) ? [
                        // icon to indicate rise and fall
                        Icon(
                          (widget.data[_selectedStateCode]['delta']['deceased'] < 0) ?
                          Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
                          size: 15,
                        ),
                        Text(
                          '${widget.data[_selectedStateCode]['delta']['deceased']}',
                          style: stateTileSubtitleTextStyle,
                        ),
                      ] : [],
                    ) : SizedBox(),
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
