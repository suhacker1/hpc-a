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

### Profiling 
