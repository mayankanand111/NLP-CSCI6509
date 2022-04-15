#!/local/bin/python3
from nltk.tbl.demo import postag

postag(num_sents = None, train = 0.7665)

# Accuracy on train set: 0.9009
# Accuracy on test set: 0.9242
# top 3 rules are :
# NN->VB if Pos:-NONE-@[-2] & Pos:TO@[-1]
# VBP->VB if Pos:MD@[-3,-2,-1]
# VBP->VB if Pos:TO@[-1]
# So as from Accuaracy scores we can see that Brill tagger is better than HMM tagger but not as better as CRF tagger becuase with CRF tagger we got accuracy of just below 95. Though the
# difference between Brill and CRF is not that huge.