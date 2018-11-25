# This file outputs the app IDs of the app corpus
import play_scraper  # scraper for google play store
import re


def app_list_creation(nresults, npage, nage, strings, outputfile):
    # Collecting data
    # Note that the collection and category stay constant while result
    # numbers, pages, and age ranges vary
    apps = play_scraper.collection(
        collection='TOP_FREE', category='FAMILY', results=nresults, page=npage, age=nage)
    # Extracting app IDs and removing punctuation
    app_list = str(re.findall('(?<=\'app_id\': \')\S+', str(apps)))
    app_list = app_list.replace('"', '\n')
    for string in strings:
        app_list = app_list.replace(string, '')
    app_list = app_list.strip()
    # Appending to new file
    with open(outputfile, 'a+') as outputf:
        outputf.write(app_list)


def main():
    # Defining punctuation that interferes with script feeding
    strings = [',', '\',', '\'', '[', ']', '\n']
    app_list_creation(5, 1, 'SIX_EIGHT', strings, 'app_list')
    app_list_creation(5, 1, 'NINE_UP', strings, 'app_list')

if __name__ == '__main__':
    main()
