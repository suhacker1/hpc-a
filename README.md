# HPCA: HPC-based COPPA violations Analyzer
## Data Collection
In order to run HPCA, you must create and utilize a dataset with the HPC profile and COPPA label of each app. The tools necessary for data collection are: 
1. Python 2.7 or higher 
2. [Play_scraper](https://pypi.org/project/play_scraper/)

### App Selection and COPPA Label Extraction
1. Edit and run scraper_for_app_list.py, replacing the dummy values with your chosen values for app amount and age ranges. This will create the app list. 
2. Remove all apps not covered in the [COPPA census repository](https://www.appcensus.mobi/). 
3. Remove all apps no longer available in the Google Play Store. 
4. Go to the app's profile in the COPPA repository. 
5. Copy the guide_to_reading_coppa_compliance_status_data for the app.
6. For each feature, replace the violation with a 1 or a 0 if it does or does not exist, respectively. This represents the y vector for the app. 

### Simpleperf Download
1. Download Android Studio and any necessary dependencies. 
2. Open Android Studio. 
3. Press the gear at the bottom right to enter configuration settings. 
4. Choose ‘SDK Manager’.
5. Choose ‘SDK Tools’. 
6. Click on the boxes for ‘Android SDK Tools’ and ‘NDK’. Change the location above the list to set your path. 
7. Press apply to begin installation of components. 
8. Press Finish when done. 

### Setting up Simpleperf through ADB Shell 
1. Go to the Android SDK location (set during component installation). 
2. Locate the platform-tools folder and set it as your path. 
3. Connect your device with an USB, ensuring that Developer Options and USB Debugging are enabled. 
4. Run “adb devices” to check if your device is properly connected. 
5. Return to the SDK location.
6. Enter ndk-bundle/simpleperf/bin/android/arm to locate the simpleperf binary. 
7. Push the simpleperf binary to the same folder as the adb binary. 
8. Run “adb push simpleperf data/local/tmp” to push the binary onto the device. 
9. Use “adb shell” followed by “su” to enter the shell and establish root privilege. 
10. Set path as /data/local/tmp. 
11. Run ./simpleperf to make sure it works. 

### Gathering Pertinent Information
1. Run ./simpleperf list for all supported events. 
2. Run ./simpleperf list hw for all supported hardware events. 
3. Create a list of all the events you want to test and split them into sets of 5 (or another number depending on your processor). 

### Obtaining Profiling Data
1. Ensure monkey works. 
2. Set a constant seed and duration value. 
3. Use the stat command for each event set.
Sample Command: monkey -p com.jg.spongeminds.preschooldemo  -v 1050 -s 42 ; ./simpleperf stat --app com.jg.spongeminds.preschooldemo --csv -e L1-icache-load-misses,LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses --duration 30 --interval 50 -o test/com.jg.spongeminds.preschooldemo_set2.csv
Notes: 
⋅⋅* Always include the full package name after --app. 
⋅⋅* The process ID and thread options tend to be unreliable. You can use -a to generalize event counting. 
⋅⋅* Add --csv to make sure the output file is in a comma separated form. Excluding it will allow you to read the data, but not manipulate it easily.
⋅⋅* For the events list, when listing multiple events, simpleperf requires the name is be exactly as it was shown in the output of ./simpleperf list. Additionally, there cannot be any spaces and there must be a comma between events. 
⋅⋅* Note that using -e $(cat events.txt) works so long as the text file follows the same guidelines. 
⋅⋅* Measuring more than six events at a time results in multiplexing and should be avoided. 
⋅⋅* You can use --group instead of -e to sync event monitoring.
⋅⋅* Optionally, include --duration for simpleperf to run only at a specified amount of seconds. Excluding this would require a manual exit (CTRL-C). 
⋅⋅* Including --interval prints statistics every specified amount of milliseconds. While using this option results in a larger output file, it facilitates detecting possible multiplexing. 
⋅⋅* Note that if you use this option, only the very last counts for each event will matter in the output file. 
⋅⋅* If you do not choose a file name after -o, it will output all the results to perf.data. 
