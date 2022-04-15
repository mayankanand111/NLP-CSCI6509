#!/local/bin/python3
from nltk.corpus import treebank
from nltk import chunk, tag
from nltk import FreqDist

chunked_data = []
chunked_trees = []
final_list = []
word_fd = ()
data = treebank.tagged_sents()


for d in data:
    chunked_data.append(chunk.ne_chunk(d,binary=True))


for x in chunked_data:
        chunked_trees.append(x.subtrees(filter = lambda t: t.label() in ["NE"]))


for x in chunked_trees:
    for y in x:
        final_list.append(y)


word_fd = FreqDist([' '.join(word for word, pos in f) for f in final_list])

print("Three most common named entities are: ")
for token, freq in word_fd.most_common(3):
    print("%s : %d"%(token, freq))