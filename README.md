# Covid-19 Cases Tracker
This is a Flutter application for viewing the stats of the novel coronavirus (Covid-19) cases in India.

## API Used
I have used [Covid19India](https://github.com/covid19india/api) as the API to fetch the daily data related to the number of novel coronavirus cases in India. Covid19India provides a great amount of data in a properly structured json format. Additionally, they have engineered their open-source initiative to result into beautiful end results such as their website [covid19india.org](https://covid19india.org).

## Steps to run the application
The current app is a very basic version of just viewing the daily stats about the number concerning the thing encircling our lives since a year now. The release apk is there in the release section of the repository, you can check it out there. But if you want to go ahead and do something more creative, you are most welcome. In the meantime, follow the given steps to get this running on your own emulator:
### 1. Clone the repository
Clone the repository either by ```git clone https://github.com/fourpointfour/covid-cases-tracker``` or by directly downloading the zip file.
### 2. Opening main.dart
Use Android Studio, VS Code or IntelliJ, whatever you prefer, and open the main.dart file, this is where you need to start looking, if you are interested in working further on this. This is the file that is responsible for the launch of the application, so if you are doing your analysis, you now know where to begin.
### 3. Run the app
Now use whatever device you want to run this on, just launch the virtual device and run main.dart, you'll see everything if falling into place one by one. Good luck ;)

## Issue while building the apk
A possible issue was encountered while building the apk, the build fails with an error message about the gradle. The issue was however due to some bug either in the gradle version or some incomplete installation on the system. However it was resolved after making a change in the /android/gradle/wrapper/gradle-wrapper.properties

Change ```distributionUrl=https\://services.gradle.org/distributions/gradle-5.6.2-all.zip``` to ```distributionUrl=https\://services.gradle.org/distributions/gradle-6.3-all.zip``` or some other stable or latest version number. Everything works fine after that.
