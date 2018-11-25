import re


def prepare_full_events_list(input,  # file output from ./simpleperf list
                             output,  # a new file to be used as the event list
                             non_event_words,  # strings that signify a line not naming an event
                             comments,  # string that indicates a comment
                             hw_end):  # string that signifies the end of the hardware events
    with open(input) as inputf, open(output, 'w') as outputf:
        for num, line in enumerate(inputf, 1):
            if hw_end in line:  # removes non hardware events
                exit()
            else:
                # non event lines not read
                if not any(non_event_word in line for non_event_word in non_event_words):
                    if any(comment in line for comment in comments):
                        # takes the comments out of lines with event names
                        line, hit, miss = line.partition(comments)
                    line = line.strip()
                    outputf.write(line + ',')


def split_events(input, output, skip):
    with open(input) as f:
        content = f.readlines()
    event = re.findall('[^,]+', str(content))

    with open(output, 'w') as outputf:
        for num, p in enumerate(event, 1):
            if num % int(skip) == 0:
                p = p + ',' + '\n'
                outputf.write(p)
            else:
                p = p + ','
                outputf.write(p)
    return output


def create_sets(input):
    with open(input) as input:
        for num, line in enumerate(input, 1):
            f = open("set%s" % num, "w+")
            f.write(line)


def main():
	prepare_full_events_list('fullevents.txt', 'event_list', [
                             'List of'], '#', 'List of software events:')
	split = split_events('event_list', 'five_split', 5)
    create_sets(split)
    
if __name__ == '__main__':
	main()
