#!/local/bin/python3
from nltk.corpus import treebank
from nltk.tag import hmm

train_data = treebank.tagged_sents()[0:3000]
test_data = treebank.tagged_sents()[3000:]

print(train_data[0])

trainer = hmm.HiddenMarkovModelTrainer()
tagger = trainer.train_supervised(train_data)

print(tagger)

print(tagger.tag("Today is a good day.".split()))

print(tagger.tag("Joe met Joanne in New Delhi.".split()))

print(tagger.tag("Chicago is the birthplace of Marry".split()))

print(tagger.evaluate(test_data))

# day should be NN (common noun) instead of NPP (proper noun) because day doesnot define any specific name, place, animal or thing.
# birthplace should be NN instead of NNP because of same reason as birthplace doesnot define any name, place, animal or thing.
# of should be IN instead of NPP.