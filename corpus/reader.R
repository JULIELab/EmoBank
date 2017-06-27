rm(list=ls())
source("combine.R")
df.reader = corpus.final[c("sentence", "Val.R", "Aro.R","Dom.R")]
colnames(df.reader) = c("Sentence", "Valence","Arousal","Dominance")
rm(corpus.final)
