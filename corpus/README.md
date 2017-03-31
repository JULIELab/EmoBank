This folder contains four tsv files and one R script. 

The tsv files are 
* raw.tsv containing the textual data of this corpus,
* meta.tsv containing genre-information,
* reader.tsv and ...
* writer.tsv which both contain the emotion meta-data for the writer and reader perspective, respectively.

These meta-data files contain columns for the three emotional dimensions (Valence, Arousal and Dominance) as well as the standard deviation of the human ratings for the individual item. The last column, "freq", gives the number of valid ratings for this item (after the filtering process described in the paper).

The IDs for sentences taken from MASC follow the pattern \<documentName>\_\<beginIndex>\_\<endIndex> which refers to the file names and the sentence boundary annotations as included in the MASC release 3.0.0. For the news headlines taken from SemEval, the IDs follow the pattern SemEval\_\<originalSemEvalId>.

The script combine.R combines those individual files into a single R data frame (only taken into account the sentences which received sufficient ratings for both reader and writer perspective).
