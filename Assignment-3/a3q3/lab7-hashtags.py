#!/local/bin/python
import csv, nltk, re
from nltk.tokenize import word_tokenize
from nltk import FreqDist

profiles = ["DalhousieU", "Google", "msdev", "CBCNS"]
dal_list = []
google_list = []
msdev_list = []
cbc_list = []
with open ('lab7-tweets.csv', 'r') as infile:
    reader = csv.reader(infile,quotechar='"')
    for row in reader:
        if row[1] == profiles[0]:
            dal_list.append(row[3])
        elif row[1] == profiles[1]:
            google_list.append(row[3])
        elif row[1] == profiles[2]:
            msdev_list.append(row[3])
        elif row[1] == profiles[3]:
            cbc_list.append(row[3])

dict = {profiles[0]:dal_list, profiles[1]:google_list, profiles[2]:msdev_list, profiles[3]:cbc_list}

for key, value in dict.items():
    str = ""
    l = []
    for rows in value:
        str += " " + rows
    fd = FreqDist(word_tokenize(str))
    print(key + ":")
    print("* unique tokens:",end=' ')
    for token in fd:
        l.append(token)
    str1 = ", ".join(l)
    print(str1)
    hashtags = re.findall(r'#\w+[!]*',str)
    hashtags = list(set(hashtags))
    print("* hashtags: "+", ".join(hashtags))