
# 0 Folder Content

This folder contains raw and meta data of EmoBank. In particular, it contains
* ```raw.csv```: The raw textual data.
* ```meta.tsv```: The source and genre meta-data.
* ```reader.csv```: The gold ratings from the reader perspective
* ```writer.csv```: The gold ratings fromt the writer perspective
* ```emobank.csv```: Weighted average of reader and writer annotations. **Use this file by default.**

# 1 Loading EmoBank

EmoBank comes with annotations according to two *perspectives* (reader and writer). However, for most use cases, this distinction may not be relevant. In these cases, I would advise to use the combination of both annotions perspectives to increase reliability. These combined ratings are stored for convenience in ```emobank.csv``` and can be loaded like this:


```python
import pandas as pd
eb = pd.read_csv("emobank.csv", index_col=0)
```

## 1.1 Data Format

The columns V, A and D represent Valence (negative vs. positive), Arousal (calm vs. excited), and Dominance (being controlled vs. being in control). Each of those take numeric values from [1, 5]. Please refer to the paper for further details.


```python
print(eb.shape)
eb.head()
```

    (10062, 4)





<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>V</th>
      <th>A</th>
      <th>D</th>
      <th>text</th>
    </tr>
    <tr>
      <th>id</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>110CYL068_1036_1079</th>
      <td>3.00</td>
      <td>3.00</td>
      <td>3.20</td>
      <td>Remember what she said in my last letter? "</td>
    </tr>
    <tr>
      <th>110CYL068_1079_1110</th>
      <td>2.80</td>
      <td>3.10</td>
      <td>2.80</td>
      <td>If I wasn't working here.</td>
    </tr>
    <tr>
      <th>110CYL068_1127_1130</th>
      <td>3.00</td>
      <td>3.00</td>
      <td>3.00</td>
      <td>.."</td>
    </tr>
    <tr>
      <th>110CYL068_1137_1188</th>
      <td>3.44</td>
      <td>3.00</td>
      <td>3.22</td>
      <td>Goodwill helps people get off of public assist...</td>
    </tr>
    <tr>
      <th>110CYL068_1189_1328</th>
      <td>3.55</td>
      <td>3.27</td>
      <td>3.46</td>
      <td>Sherry learned through our Future Works class ...</td>
    </tr>
  </tbody>
</table>
</div>



##  1.2 Quick sanity check
Print most extreme sentences in either of three dimensions.


```python
for d in ["V", "A", "D"]:
    print("Min {}:\n{}".format(d, eb.loc[eb[d].argmin()]))
    print()
    print("Max {}:\n{}".format(d, eb.loc[eb[d].argmax()]))
    print()
    print()
```

    Min V:
    V              1.2
    A              4.2
    D              3.8
    text    "Fuck you"
    Name: A_defense_of_Michael_Moore_12034_12044, dtype: object

    Max V:
    V                                4.6
    A                                4.3
    D                                3.7
    text    lol Wonderful Simply Superb!
    Name: vampires_4446_4474, dtype: object


    Min A:
    V                                              3.1
    A                                              1.8
    D                                              3.1
    text    I was feeling calm and private that night.
    Name: Nathans_Bylichka_2070_2112, dtype: object

    Max A:
    V                            4.3
    A                            4.4
    D                            3.4
    text    "My God, yes, yes, yes!"
    Name: captured_moments_28728_28752, dtype: object


    Min D:
    V                                                       2
    A                                                       3
    D                                                    1.78
    text    I shivered as I walked past the pale man’s bla...
    Name: Nathans_Bylichka_40025_40116, dtype: object

    Max D:
    V        1.7
    A        3.9
    D        4.2
    text    “NO”
    Name: defenders5_3431_3435, dtype: object




## 1.3 Loading Individual Parts

If you want to work with either the reader or the writer set of annotations individually, here is how to access those.

### 1.3.1 Raw Text


```python
raw = pd.read_csv("raw.csv", index_col=0)
raw.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>text</th>
    </tr>
    <tr>
      <th>id</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Acephalous-Cant-believe_4_47</th>
      <td>I can't believe I wrote all that last year.</td>
    </tr>
    <tr>
      <th>Acephalous-Cant-believe_83_354</th>
      <td>Because I've been grading all damn day and am ...</td>
    </tr>
    <tr>
      <th>Acephalous-Cant-believe_355_499</th>
      <td>However, when I started looking through my arc...</td>
    </tr>
    <tr>
      <th>Acephalous-Cant-believe_500_515</th>
      <td>What do I mean?</td>
    </tr>
    <tr>
      <th>Acephalous-Cant-believe_517_626</th>
      <td>The posts I consider foundational to my curren...</td>
    </tr>
  </tbody>
</table>
</div>



### 1.3.2 Reader Perspective Annotations


```python
reader = pd.read_csv("reader.csv", index_col=0)
reader.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>V</th>
      <th>A</th>
      <th>D</th>
      <th>stdV</th>
      <th>stdA</th>
      <th>stdD</th>
      <th>N</th>
    </tr>
    <tr>
      <th>id</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>110CYL068_1036_1079</th>
      <td>3.0</td>
      <td>3.20</td>
      <td>3.00</td>
      <td>0.00</td>
      <td>0.40</td>
      <td>0.00</td>
      <td>5</td>
    </tr>
    <tr>
      <th>110CYL068_1079_1110</th>
      <td>2.6</td>
      <td>3.00</td>
      <td>2.60</td>
      <td>0.49</td>
      <td>0.63</td>
      <td>0.49</td>
      <td>5</td>
    </tr>
    <tr>
      <th>110CYL068_1110_1127</th>
      <td>2.0</td>
      <td>2.33</td>
      <td>2.33</td>
      <td>1.41</td>
      <td>0.47</td>
      <td>0.47</td>
      <td>3</td>
    </tr>
    <tr>
      <th>110CYL068_1127_1130</th>
      <td>3.0</td>
      <td>3.00</td>
      <td>3.00</td>
      <td>0.00</td>
      <td>0.00</td>
      <td>0.00</td>
      <td>2</td>
    </tr>
    <tr>
      <th>110CYL068_1137_1188</th>
      <td>3.6</td>
      <td>3.00</td>
      <td>3.40</td>
      <td>0.80</td>
      <td>0.63</td>
      <td>0.49</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>



### 1.3.3 Writer Perspective Annotations


```python
writer = pd.read_csv("writer.csv", index_col=0)
writer.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>V</th>
      <th>A</th>
      <th>D</th>
      <th>stdV</th>
      <th>stdA</th>
      <th>stdD</th>
      <th>N</th>
    </tr>
    <tr>
      <th>id</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>110CYL068_1036_1079</th>
      <td>3.00</td>
      <td>2.8</td>
      <td>3.4</td>
      <td>0.00</td>
      <td>0.98</td>
      <td>0.49</td>
      <td>5</td>
    </tr>
    <tr>
      <th>110CYL068_1079_1110</th>
      <td>3.00</td>
      <td>3.2</td>
      <td>3.0</td>
      <td>0.00</td>
      <td>0.40</td>
      <td>0.00</td>
      <td>5</td>
    </tr>
    <tr>
      <th>110CYL068_1127_1130</th>
      <td>3.00</td>
      <td>3.0</td>
      <td>3.0</td>
      <td>0.00</td>
      <td>0.00</td>
      <td>0.00</td>
      <td>5</td>
    </tr>
    <tr>
      <th>110CYL068_1137_1188</th>
      <td>3.25</td>
      <td>3.0</td>
      <td>3.0</td>
      <td>0.43</td>
      <td>0.71</td>
      <td>0.00</td>
      <td>4</td>
    </tr>
    <tr>
      <th>110CYL068_1189_1328</th>
      <td>3.40</td>
      <td>3.4</td>
      <td>3.2</td>
      <td>0.49</td>
      <td>0.49</td>
      <td>0.40</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>



## 2 Function for Combining Individual Parts

This code was used to generate ```emobank.csv```.


```python
from pathlib import Path
import pandas as pd

def load_emobank(path):
    """
    path..........The path to this folder.
    """
    path = Path(path)
    raw = pd.read_csv(path / "raw.csv", index_col=0)
    writer = pd.read_csv(path / "writer.csv", index_col=0)
    reader = pd.read_csv(path / "reader.csv", index_col=0)

    common = sorted(list(set(writer.index).intersection(set(reader.index))))

    # redefine reader, writer as arrays
    N_reader = (reader.loc[common,"N"]).values.reshape((len(common),1))
    N_writer = (writer.loc[common,"N"]).values.reshape((len(common),1))

    reader = (reader.loc[common, ["V", "A","D"]]).values
    writer = (writer.loc[common, ["V", "A","D"]]).values

    #compute weighted average of annotations
    combined = ( (reader * N_reader) + (writer * N_writer) ) / (N_reader + N_writer)

    combined = pd.DataFrame(columns = ["V", "A", "D"], data=combined, index=common).round(2)
    combined["text"] = raw.loc[common]
    combined.index.rename("id", inplace=True)

    assert combined.shape == (10062, 4)
    return combined
```


```python
import csv
eb = load_emobank(".")  # This assumes that /.../EmoBank/corpus is your working directory. 
                        # Otherwise make sure to insert the correct path to /.../EmoBank/corpus between the quotes.
eb.to_csv("emobank.csv", quoting = csv.QUOTE_NONNUMERIC)
```

----
