rm(list=ls())
source("combine.R")
df.writer = corpus.final[c("sentence", "Val.W", "Aro.W","Dom.W")]
colnames(df.writer) = c("Sentence", "Valence","Arousal","Dominance")
rm(corpus.final)
