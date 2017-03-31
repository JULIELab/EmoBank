rm(list = ls())

path.writer.emotion = "writer.tsv"
path.reader.emotion = "reader.tsv"
path.raw = "raw.tsv"
path.meta = "meta.tsv"

df.writer = read.delim(path.writer.emotion)
df.reader = read.delim(path.reader.emotion)
df.raw = read.delim(path.raw, quote = NULL)
df.meta = read.delim(path.meta)

df.full = merge(df.meta, df.raw, by = "id")
df.full = merge(df.full, df.writer, by = "id")
df.full = merge(df.full, df.reader, by = "id", suffixes = c(".writer", ".reader"))

corpus.final = data.frame(df.full$sentence, df.full[,1:4], 
                          df.full[8], df.full[6], df.full[7], 
                          df.full[11], df.full[9], df.full[10], 
                          df.full[15], df.full[13], df.full[14],
                          df.full[18], df.full[16], df.full[17],
                          df.full[12], df.full[19])
colnames(corpus.final) = c("sentence", "id", "document", "category","subcategory", 
                           "Val.W", "Aro.W", "Dom.W", 
                           "s.Val.W", "s.Aro.W", "s.Dom.W",
                           "Val.R", "Aro.R", "Dom.R",
                           "s.Val.R", "s.Aro.R", "s.Dom.R",
                           "freq.W", "freq.R"
                           )

rm(list=setdiff(ls(), c("corpus.final")))


