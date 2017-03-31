This folder contains two subfolders, one for the movie review data and one for the genre-balanced data.

Both folders contain four tsv files:
* raw.tsv stores the raw textual data,
* reader.tsv, ...
* text.tsv and ...
* writer.tsv contain the ratings which those sentences received in our pilot study.

Those three rating files are organized like this: each row stores the ratings of one participant. The column headers are named following the pattern \<sentenceId>-\<Dimension> where the sentence IDs for the genre-balanced part are further described in EmoBank/corpus/README.md and the sentence IDs of the movie-review part are equal to those of the Standford Sentiment Treebank. \<Dimension> is either V, A or D (Valence, Arousal or Dominance).

Different from that, the first nine columns in each rating file refers to the trial items. The expected ratings for these items are (9,9,9,1,9,5,7,3,1).
