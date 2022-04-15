#!/local/bin/python3
from nltk.corpus import treebank
from nltk.tag import crf

train_data = treebank.tagged_sents()[0:3000]
test_data = treebank.tagged_sents()[3000:]

tagger = crf.CRFTagger()
tagger.train(train_data,'model.crf.tagger')

print(tagger)
print(tagger.evaluate(test_data))


#print(tagger.tag("Today is a good day.".split()))
#print(tagger.tag("Joe met Joanne in New Delhi.".split()))
#print(tagger.tag("Chicago is the birthplace of Marry".split()))

# so, as from the value obtained from evaluate method we can simply say that CRF taggers with score of just below 95% outperforms HMM Tagger with a score of just 36%.
# but that doesnot mean in all the cases CRF tagger will perform better than HMM tagger. I printed same lines that we did in previous program of HMM and found that word 'Today'
# is returned as NNP from CRF Tagger and NN from HMM Tagger. Which shows HMM Tagger tagged word 'Today' correctly as comman noun (NN) rather than proper noun (NNP) because 'Today'
# doesnot define any name, place, animal or thing which defines proper nouns.