---
title       : Getting data
subtitle    : 
author      : Jeffrey Leek
job         : Johns Hopkins Bloomberg School of Public Health
logo        : bloomberg_shield.png
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow   # 
url:
  assets: ../../assets
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---


## Pro Tip

__Once you know something there is temptation to be a snob. Don't be.__

<img class="center" src="../../assets/img/purity.png" height=400>


http://simplystatistics.org/2014/01/28/marie-curie-says-stop-hating-on-quilt-plots-already/

---

## Paper of the day

Statistical inference for exploratory data analysis and model diagnostics

"We propose to furnish visual statistical methods with an inferential framework and protocol, modelled on confirmatory statistical testing. In this framework, plots take on the role of test statistics, and human cognition the role of statistical tests."

http://rsta.royalsocietypublishing.org/content/367/1906/4361.full


---

## My belief about statisticians

* Define the question
* Define the ideal data set
* <redtext>Determine what data you can access </redtext>
* <redtext>Obtain the data </redtext>
* <redtext>Clean the data </redtext>
* Exploratory data analysis
* Statistical prediction/modeling
* Interpret results
* Challenge results
* Synthesize/write up results
* Create reproducible code


---


## Why? 

<center> "Real scientists make their own data" -Sean Taylor</center>

<center> "Real scientists make (and know how to get) their own data" -Jeff </center>

1. Most major contributions to real science involve data collection (by you/others)
2. Making/getting your own data gives you priveledged access to scientific findings
3. If you create the data you will understand it better
4. You can do things like experimental design (e.g. randomized experiments)

[http://seanjtaylor.com/post/41463778912/real-scientists-make-their-own-data](http://seanjtaylor.com/post/41463778912/real-scientists-make-their-own-data)


---

## What you wish data looked like

<img class=center src=../../assets/img/03_ObtainingData/excel.png height=450>


---

## What does data really look like? 

<img class=center src=../../assets/img/03_ObtainingData/fastq.png height=450/>


[http://brianknaus.com/software/srtoolbox/s_4_1_sequence80.txt](http://brianknaus.com/software/srtoolbox/s_4_1_sequence80.txt)


--- 

## What does data really look like? 

<img class=center src=../../assets/img/03_ObtainingData/twitter.png height= 450/>


[https://dev.twitter.com/docs/api/1/get/blocks/blocking](https://dev.twitter.com/docs/api/1/get/blocks/blocking)

---

## What does data really look like?


<img class=center src=../../assets/img/03_ObtainingData/medicalrecord.png height=400/>


[http://blue-button.github.com/challenge/](http://blue-button.github.com/challenge/)



---

## What does data really look like?

<img class=center src=../../assets/img/fmri.jpeg height= 450/>


[http://spectrum.ieee.org/tech-talk/biomedical/imaging/sorting-fmri-with-textmining-software](http://spectrum.ieee.org/tech-talk/biomedical/imaging/sorting-fmri-with-textmining-software)

---

## Where is data?


<img class=center src=../../assets/img/harddrive.jpg height= 450/>

[http://en.wikipedia.org/wiki/Sneakernet](http://en.wikipedia.org/wiki/Sneakernet)

[http://en.wikipedia.org/wiki/File:USB-Hard-Drive.jpg](http://en.wikipedia.org/wiki/File:USB-Hard-Drive.jpg)

---

## Where is data?

<img class=center src=../../assets/img/03_ObtainingData/databases.png height=400/>


[http://rickosborne.org/blog/2010/02/infographic-migrating-from-sql-to-mapreduce-with-mongodb/](http://rickosborne.org/blog/2010/02/infographic-migrating-from-sql-to-mapreduce-with-mongodb/)


---

## Where is data?

<img class=center src=../../assets/img/03_ObtainingData/twitter.png height= 450/>

[https://dev.twitter.com/docs/api/1/get/blocks/blocking](https://dev.twitter.com/docs/api/1/get/blocks/blocking)


---

## Where is data?

<img class=center src=../../assets/img/03_ObtainingData/baltimore.png height= 450/>

[https://data.baltimorecity.gov/](https://data.baltimorecity.gov/)

---

## Definition of data

<q>Data are values of qualitative or quantitative variables, belonging to a set of items.</q>

[http://en.wikipedia.org/wiki/Data](http://en.wikipedia.org/wiki/Data)

---

## Definition of data
<q>Data are values of qualitative or quantitative variables, belonging to a <redtext>set of items</redtext>.</q>

[http://en.wikipedia.org/wiki/Data](http://en.wikipedia.org/wiki/Data)

__Set of items__: Sometimes called the population; the set of objects you are interested in

---

## Definition of data
<q>Data are values of qualitative or quantitative <redtext>variables</redtext>, belonging to a set of items.</q>

[http://en.wikipedia.org/wiki/Data](http://en.wikipedia.org/wiki/Data)

__Variables__: A measurement or characteristic of an item.


---

## Definition of data
<q>Data are values of <redtext>qualitative</redtext> or <redtext>quantitative</redtext> variables, belonging to a set of items.</q>

[http://en.wikipedia.org/wiki/Data](http://en.wikipedia.org/wiki/Data)


__Qualitative__: Country of origin, sex, treatment

__Quantitative__: Height, weight, blood pressure

---

## Raw versus processed data

__Raw data__
* The original source of the data
* Often hard to use for data analyses
* Data analysis _includes_ processing
* Raw data may only need to be processed once

[http://en.wikipedia.org/wiki/Raw_data](http://en.wikipedia.org/wiki/Raw_data)

__Processed data__
* Data that is ready for analysis
* Processing can include merging, subsetting, transforming, etc.
* There may be standards for processing
* All steps should be recorded 

[http://en.wikipedia.org/wiki/Computer_data_processing](http://en.wikipedia.org/wiki/Computer_data_processing)

---

## An example of a processing pipeline

<img class=center src=../../assets/img/03_ObtainingData/hiseq.jpeg height=450/>

[http://www.illumina.com.cn/support/sequencing/sequencing_instruments/hiseq_1000.asp](http://www.illumina.com.cn/support/sequencing/sequencing_instruments/hiseq_1000.asp)

---

## An example of a processing pipeline

<img class=center src=../../assets/img/03_ObtainingData/processing.png height=400 />

[http://www.cbcb.umd.edu/~hcorrada/CMSC858B/lectures/lect22_seqIntro/seqIntro.pdf](http://www.cbcb.umd.edu/~hcorrada/CMSC858B/lectures/lect22_seqIntro/seqIntro.pdf)

---

---

## The raw data


* The strange binary file your measurement machine spits out
* The unformatted Excel file with 10 worksheets the company you contracted with sent you
* The complicated JSON data you got from scraping the Twitter API
* The hand-entered numbers you collected looking through a microscope

_You know the raw data is in the right format if you_ 

1. Ran no software on the data
2. Did not manipulate any of the numbers in the data
3. You did not remove any data from the data set
4. You did not summarize the data in any way

[https://github.com/jtleek/datasharing](https://github.com/jtleek/datasharing)


---

## The tidy data

1. Each variable you measure should be in one column
2. Each different observation of that variable should be in a different row
3. There should be one table for each "kind" of variable
4. If you have multiple tables, they should include a column in the table that allows them to be linked

_Some other important tips_

* Include a row at the top of each file with variable names. 
* Make variable names human readable AgeAtDiagnosis instead of AgeDx
* In general data should be saved in one file per table.

[https://github.com/jtleek/datasharing](https://github.com/jtleek/datasharing)


---

## The code book

1. Information about the variables (including units!) in the data set not contained in the tidy data
2. Information about the summary choices you made
3. Information about the experimental study design you used


_Some other important tips_

* A common format for this document is a Word/text file. 
* There should be a section called "Study design" that has a thorough description of how you collected the data. 
* There must be a section called "Code book" that describes each variable and its units.


[https://github.com/jtleek/datasharing](https://github.com/jtleek/datasharing)


---

## The instruction list 

* Ideally a computer script (in R :-), but I suppose Python is ok too...)
* The input for the script is the raw data
* The output is the processed, tidy data
* There are no parameters to the script

In some cases it will not be possible to script every step. In that case you should provide instructions like: 

1. Step 1 - take the raw file, run version 3.1.2 of summarize software with parameters a=1, b=2, c=3
2. Step 2 - run the software separately for each sample
3. Step 3 - take column three of outputfile.out for each sample and that is the corresponding row in the output data set

[https://github.com/jtleek/datasharing](https://github.com/jtleek/datasharing)



---

## Why is the instruction list important? 

<img class=center src=../../assets/img/03_ObtainingData/rr.png height=200 />

<img class=center src=../../assets/img/03_ObtainingData/rrcolbert.jpeg height=250>


[http://www.colbertnation.com/the-colbert-report-videos/425748/april-23-2013/austerity-s-spreadsheet-error](http://www.colbertnation.com/the-colbert-report-videos/425748/april-23-2013/austerity-s-spreadsheet-error)

---

## Get/set your working directory

* A basic component of working with data is knowing your working directory
* The two main commands are ```getwd()``` and ```setwd()```. 
* Be aware of relative versus absolute paths
  * __Relative__ - ```setwd("./data")```, ```setwd("../")```
  * __Absolute__ - ```setwd("/Users/jtleek/data/")```
* Important difference in Windows ```setwd("C:\\Users\\Andrew\\Downloads")```

---

## Checking for and creating directories

* ```file.exists("directoryName")``` will check to see if the directory exists
* ```dir.create("directoryName")``` will create a directory if it doesn't exist
* Here is an example checking for a "data" directory and creating it if it doesn't exist


```r
if (!file.exists("data")) {
    dir.create("data")
}
```



---

## Getting data from the internet - download.file()

* Downloads a file from the internet
* Even if you could do this by hand, helps with reproducibility
* Important parameters are _url_, _destfile_, _method_
* Useful for downloading tab-delimited, csv, and other files


---

## Example - Baltimore camera data


<img class=center src=../../assets/img/03_ObtainingData/cameras.png height=500>

[https://data.baltimorecity.gov/Transportation/Baltimore-Fixed-Speed-Cameras/dz54-2aru](https://data.baltimorecity.gov/Transportation/Baltimore-Fixed-Speed-Cameras/dz54-2aru)


---

## Example - Baltimore camera data

<img class=center src=../../assets/img/03_ObtainingData/cameraslink.png height=500>

[https://data.baltimorecity.gov/Transportation/Baltimore-Fixed-Speed-Cameras/dz54-2aru](https://data.baltimorecity.gov/Transportation/Baltimore-Fixed-Speed-Cameras/dz54-2aru)


---

## Download a file from the web


```r
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl")
list.files("./data")
```

```
## [1] "cameras.csv"  "cameras.xlsx"
```

```r
dateDownloaded <- date()
dateDownloaded
```

```
## [1] "Tue Feb  4 07:32:39 2014"
```


---

## Some notes about download.file()

* If the url starts with _http_ you can use download.file()
* If the url starts with _https_ on Windows you may be ok
* If the url starts with _https_ on Mac you may need to set _method="curl"_
* If the file is big, this might take a while
* Be sure to record when you downloaded. 

---

## Loading flat files - read.table()

* This is the main function for reading data into R
* Flexible and robust but requires more parameters
* Reads the data into RAM - big data can cause problems
* Important parameters _file_, _header_, _sep_, _row.names_, _nrows_
* Related: _read.csv()_, _read.csv2()_


---


## Example: Baltimore camera data


```r
cameraData <- read.table("./data/cameras.csv", sep = ",", header = TRUE)
head(cameraData)
```

```
##                          address direction      street  crossStreet
## 1       S CATON AVE & BENSON AVE       N/B   Caton Ave   Benson Ave
## 2       S CATON AVE & BENSON AVE       S/B   Caton Ave   Benson Ave
## 3 WILKENS AVE & PINE HEIGHTS AVE       E/B Wilkens Ave Pine Heights
## 4        THE ALAMEDA & E 33RD ST       S/B The Alameda      33rd St
## 5        E 33RD ST & THE ALAMEDA       E/B      E 33rd  The Alameda
## 6        ERDMAN AVE & N MACON ST       E/B      Erdman     Macon St
##                 intersection                      Location.1
## 1     Caton Ave & Benson Ave (39.2693779962, -76.6688185297)
## 2     Caton Ave & Benson Ave (39.2693157898, -76.6689698176)
## 3 Wilkens Ave & Pine Heights  (39.2720252302, -76.676960806)
## 4     The Alameda  & 33rd St (39.3285013141, -76.5953545714)
## 5      E 33rd  & The Alameda (39.3283410623, -76.5953594625)
## 6         Erdman  & Macon St (39.3068045671, -76.5593167803)
```


---

## Example: Baltimore camera data

read.csv sets _sep=","_ and _header=TRUE_ 

```r
cameraData <- read.csv("./data/cameras.csv")
head(cameraData)
```

```
##                          address direction      street  crossStreet
## 1       S CATON AVE & BENSON AVE       N/B   Caton Ave   Benson Ave
## 2       S CATON AVE & BENSON AVE       S/B   Caton Ave   Benson Ave
## 3 WILKENS AVE & PINE HEIGHTS AVE       E/B Wilkens Ave Pine Heights
## 4        THE ALAMEDA & E 33RD ST       S/B The Alameda      33rd St
## 5        E 33RD ST & THE ALAMEDA       E/B      E 33rd  The Alameda
## 6        ERDMAN AVE & N MACON ST       E/B      Erdman     Macon St
##                 intersection                      Location.1
## 1     Caton Ave & Benson Ave (39.2693779962, -76.6688185297)
## 2     Caton Ave & Benson Ave (39.2693157898, -76.6689698176)
## 3 Wilkens Ave & Pine Heights  (39.2720252302, -76.676960806)
## 4     The Alameda  & 33rd St (39.3285013141, -76.5953545714)
## 5      E 33rd  & The Alameda (39.3283410623, -76.5953594625)
## 6         Erdman  & Macon St (39.3068045671, -76.5593167803)
```



---

## Some more important parameters

* _quote_ - you can tell R whether there are any quoted values quote="" means no quotes.
* _na.strings_ - set the character that represents a missing value. 
* _nrows_ - how many rows to read of the file (e.g. nrows=10 reads 10 lines).
* _skip_ - number of lines to skip before starting to read

_In my experience, the biggest trouble with reading flat files are quotation marks ` or " placed in data values, setting quote="" often resolves these_.



---

## Example: Baltimore camera data

read.csv sets _sep=","_ and _header=TRUE_ 

```r
cameraData <- scan("./data/cameras.csv", sep = ",", what = "character")
str(cameraData)
```

```
##  chr [1:486] "address" "direction" "street" "crossStreet" ...
```

```r
cameraData <- matrix(cameraData, byrow = TRUE, ncol = 6)
```





---

## Excel files

_Still probably the most widely used format for sharing data_

<img class=center src=../../assets/img/03_ObtainingData/excel2.png height=450>


[http://office.microsoft.com/en-us/excel/](http://office.microsoft.com/en-us/excel/)

---

## Download the file to load


```r
if (!file.exists("data")) {
    dir.create("data")
}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.xlsx", method = "curl")
dateDownloaded <- date()
```


---

## read.xlsx(), read.xlsx2() {xlsx package}


```r
library(xlsx)
cameraData <- read.xlsx("./data/cameras.xlsx", sheetIndex = 1, header = TRUE)
head(cameraData)
```

```
##                          address direction      street  crossStreet
## 1       S CATON AVE & BENSON AVE       N/B   Caton Ave   Benson Ave
## 2       S CATON AVE & BENSON AVE       S/B   Caton Ave   Benson Ave
## 3 WILKENS AVE & PINE HEIGHTS AVE       E/B Wilkens Ave Pine Heights
## 4        THE ALAMEDA & E 33RD ST       S/B The Alameda      33rd St
## 5        E 33RD ST & THE ALAMEDA       E/B      E 33rd  The Alameda
## 6        ERDMAN AVE & N MACON ST       E/B      Erdman     Macon St
##                 intersection                      Location.1
## 1     Caton Ave & Benson Ave (39.2693779962, -76.6688185297)
## 2     Caton Ave & Benson Ave (39.2693157898, -76.6689698176)
## 3 Wilkens Ave & Pine Heights  (39.2720252302, -76.676960806)
## 4     The Alameda  & 33rd St (39.3285013141, -76.5953545714)
## 5      E 33rd  & The Alameda (39.3283410623, -76.5953594625)
## 6         Erdman  & Macon St (39.3068045671, -76.5593167803)
```



---

## Reading specific rows and columns


```r
colIndex <- 2:3
rowIndex <- 1:4
cameraDataSubset <- read.xlsx("./data/cameras.xlsx", sheetIndex = 1, colIndex = colIndex, 
    rowIndex = rowIndex)
cameraDataSubset
```

```
##   direction      street
## 1       N/B   Caton Ave
## 2       S/B   Caton Ave
## 3       E/B Wilkens Ave
```


---

## Further notes

* The _write.xlsx_ function will write out an Excel file with similar arguments.
* _read.xlsx2_ is much faster than _read.xlsx_ but for reading subsets of rows may be slightly unstable. 
* The [XLConnect](http://cran.r-project.org/web/packages/XLConnect/index.html) package has more options for writing and manipulating Excel files
* The [XLConnect vignette](http://cran.r-project.org/web/packages/XLConnect/vignettes/XLConnect.pdf) is a good place to start for that package
* In general it is advised to store your data in either a database
or in comma separated files (.csv) or tab separated files (.tab/.txt) as they are easier to distribute.

---


## XML

* Extensible markup language
* Frequently used to store structured data
* Particularly widely used in internet applications
* Extracting XML is the basis for most web scraping
* Components
  * Markup - labels that give the text structure
  * Content - the actual text of the document

[http://en.wikipedia.org/wiki/XML](http://en.wikipedia.org/wiki/XML)


---

## Tags, elements and attributes

* Tags correspond to general labels
  * Start tags `<section>`
  * End tags `</section>`
  * Empty tags `<line-break />`
* Elements are specific examples of tags
  * `<Greeting> Hello, world </Greeting>`
* Attributes are components of the label
  * `<img src="jeff.jpg" alt="instructor"/>`
  * `<step number="3"> Connect A to B. </step>`
  

[http://en.wikipedia.org/wiki/XML](http://en.wikipedia.org/wiki/XML)

---

## Example XML file

<img class=center src=../../assets/img/03_ObtainingData/xmlexample.png height=450>


[http://www.w3schools.com/xml/simple.xml](http://www.w3schools.com/xml/simple.xml)

---

## Read the file into R


```r
library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
```

```
## [1] "breakfast_menu"
```

```r
names(rootNode)
```

```
##   food   food   food   food   food 
## "food" "food" "food" "food" "food"
```



---

## Directly access parts of the XML document


```r
rootNode[[1]]
```

```
## <food>
##   <name>Belgian Waffles</name>
##   <price>$5.95</price>
##   <description>Two of our famous Belgian Waffles with plenty of real maple syrup</description>
##   <calories>650</calories>
## </food>
```

```r
rootNode[[1]][[1]]
```

```
## <name>Belgian Waffles</name>
```




---

## Programatically extract parts of the file


```r
xmlSApply(rootNode, xmlValue)
```

```
##                                                                                                                     food 
##                               "Belgian Waffles$5.95Two of our famous Belgian Waffles with plenty of real maple syrup650" 
##                                                                                                                     food 
##                    "Strawberry Belgian Waffles$7.95Light Belgian waffles covered with strawberries and whipped cream900" 
##                                                                                                                     food 
## "Berry-Berry Belgian Waffles$8.95Light Belgian waffles covered with an assortment of fresh berries and whipped cream900" 
##                                                                                                                     food 
##                                                "French Toast$4.50Thick slices made from our homemade sourdough bread600" 
##                                                                                                                     food 
##                         "Homestyle Breakfast$6.95Two eggs, bacon or sausage, toast, and our ever-popular hash browns950"
```


---

## Programatically extract parts of the file


```r
xmlSApply(rootNode, xmlValue)
```

```
##                                                                                                                     food 
##                               "Belgian Waffles$5.95Two of our famous Belgian Waffles with plenty of real maple syrup650" 
##                                                                                                                     food 
##                    "Strawberry Belgian Waffles$7.95Light Belgian waffles covered with strawberries and whipped cream900" 
##                                                                                                                     food 
## "Berry-Berry Belgian Waffles$8.95Light Belgian waffles covered with an assortment of fresh berries and whipped cream900" 
##                                                                                                                     food 
##                                                "French Toast$4.50Thick slices made from our homemade sourdough bread600" 
##                                                                                                                     food 
##                         "Homestyle Breakfast$6.95Two eggs, bacon or sausage, toast, and our ever-popular hash browns950"
```



---

## XPath

* _/node_ Top level node
* _//node_ Node at any level
* _node[@attr-name]_ Node with an attribute name
* _node[@attr-name='bob']_ Node with attribute name attr-name='bob'

Information from: [http://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf](http://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf)


---

## Get the items on the menu and prices


```r
xpathSApply(rootNode, "//name", xmlValue)
```

```
## [1] "Belgian Waffles"             "Strawberry Belgian Waffles" 
## [3] "Berry-Berry Belgian Waffles" "French Toast"               
## [5] "Homestyle Breakfast"
```

```r
xpathSApply(rootNode, "//price", xmlValue)
```

```
## [1] "$5.95" "$7.95" "$8.95" "$4.50" "$6.95"
```




---

## Another example


<img class=center src=../../assets/img/03_ObtainingData/ravens.png height=450>

[http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens](http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens)


---

## Viewing the source

<img class=center src=../../assets/img/03_ObtainingData/ravenssource.png height=450>

[http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens](http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens)


---

## Extract content by attributes


```r
fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl, useInternal = TRUE)
scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)
teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)
scores
```

```
##  [1] "49-27"    "14-6"     "30-9"     "23-20"    "26-23"    "19-17"   
##  [7] "19-16"    "24-18"    "20-17 OT" "23-20 OT" "19-3"     "22-20"   
## [13] "29-26"    "18-16"    "41-7"     "34-17"
```

```r
teams
```

```
##  [1] "Denver"      "Cleveland"   "Houston"     "Buffalo"     "Miami"      
##  [6] "Green Bay"   "Pittsburgh"  "Cleveland"   "Cincinnati"  "Chicago"    
## [11] "New York"    "Pittsburgh"  "Minnesota"   "Detroit"     "New England"
## [16] "Cincinnati"
```


---

## Notes and further resources

* Official XML tutorials [short](http://www.omegahat.org/RSXML/shortIntro.pdf), [long](http://www.omegahat.org/RSXML/Tour.pdf)
* [An outstanding guide to the XML package](http://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf)

---

## JSON

* Javascript Object Notation
* Lightweight data storage
* Common format for data from application programming interfaces (APIs)
* Similar structure to XML but different syntax/format
* Data stored as
  * Numbers (double)
  * Strings (double quoted)
  * Boolean (_true_ or _false_)
  * Array (ordered, comma separated enclosed in square brackets _[]_)
  * Object (unorderd, comma separated collection of key:value pairs in curley brackets _{}_)


[http://en.wikipedia.org/wiki/JSON](http://en.wikipedia.org/wiki/JSON)


---

## Example JSON file

<img class=center src=../../assets/img/03_ObtainingData/githubjson.png height=450>


---

## Reading data from JSON {jsonlite package}


```r
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
```

```
##  [1] "id"                "name"              "full_name"        
##  [4] "owner"             "private"           "html_url"         
##  [7] "description"       "fork"              "url"              
## [10] "forks_url"         "keys_url"          "collaborators_url"
## [13] "teams_url"         "hooks_url"         "issue_events_url" 
## [16] "events_url"        "assignees_url"     "branches_url"     
## [19] "tags_url"          "blobs_url"         "git_tags_url"     
## [22] "git_refs_url"      "trees_url"         "statuses_url"     
## [25] "languages_url"     "stargazers_url"    "contributors_url" 
## [28] "subscribers_url"   "subscription_url"  "commits_url"      
## [31] "git_commits_url"   "comments_url"      "issue_comment_url"
## [34] "contents_url"      "compare_url"       "merges_url"       
## [37] "archive_url"       "downloads_url"     "issues_url"       
## [40] "pulls_url"         "milestones_url"    "notifications_url"
## [43] "labels_url"        "releases_url"      "created_at"       
## [46] "updated_at"        "pushed_at"         "git_url"          
## [49] "ssh_url"           "clone_url"         "svn_url"          
## [52] "homepage"          "size"              "stargazers_count" 
## [55] "watchers_count"    "language"          "has_issues"       
## [58] "has_downloads"     "has_wiki"          "forks_count"      
## [61] "mirror_url"        "open_issues_count" "forks"            
## [64] "open_issues"       "watchers"          "default_branch"   
## [67] "master_branch"
```

```r
jsonData$name
```

```
##  [1] "ballgown"       "dataanalysis"   "datascientist"  "datasharing"   
##  [5] "derfinder"      "derfinder-1"    "DSM"            "EDA-Project"   
##  [9] "futureofstats"  "googleCite"     "graduate"       "healthvis"     
## [13] "jhsph753"       "jhsph753and4"   "leekasso"       "modules"       
## [17] "portfolio"      "rdsmGeneSig"    "reviews"        "rfitbit"       
## [21] "rpackages"      "sva"            "swfdr"          "talks"         
## [25] "testrepository" "tornado"        "tsp-devel"      "tspreg"
```



---

## Nested objects in JSON


```r
names(jsonData$owner)
```

```
##  [1] "login"               "id"                  "avatar_url"         
##  [4] "gravatar_id"         "url"                 "html_url"           
##  [7] "followers_url"       "following_url"       "gists_url"          
## [10] "starred_url"         "subscriptions_url"   "organizations_url"  
## [13] "repos_url"           "events_url"          "received_events_url"
## [16] "type"                "site_admin"
```

```r
jsonData$owner$login
```

```
##  [1] "jtleek" "jtleek" "jtleek" "jtleek" "jtleek" "jtleek" "jtleek"
##  [8] "jtleek" "jtleek" "jtleek" "jtleek" "jtleek" "jtleek" "jtleek"
## [15] "jtleek" "jtleek" "jtleek" "jtleek" "jtleek" "jtleek" "jtleek"
## [22] "jtleek" "jtleek" "jtleek" "jtleek" "jtleek" "jtleek" "jtleek"
```



---

## Writing data frames to JSON


```r
myjson <- toJSON(iris, pretty = TRUE)
cat(myjson)
```

```
## [
## 	{
## 		"Sepal.Length" : 5.1,
## 		"Sepal.Width" : 3.5,
## 		"Petal.Length" : 1.4,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.9,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 1.4,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.7,
## 		"Sepal.Width" : 3.2,
## 		"Petal.Length" : 1.3,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.6,
## 		"Sepal.Width" : 3.1,
## 		"Petal.Length" : 1.5,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5,
## 		"Sepal.Width" : 3.6,
## 		"Petal.Length" : 1.4,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.4,
## 		"Sepal.Width" : 3.9,
## 		"Petal.Length" : 1.7,
## 		"Petal.Width" : 0.4,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.6,
## 		"Sepal.Width" : 3.4,
## 		"Petal.Length" : 1.4,
## 		"Petal.Width" : 0.3,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5,
## 		"Sepal.Width" : 3.4,
## 		"Petal.Length" : 1.5,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.4,
## 		"Sepal.Width" : 2.9,
## 		"Petal.Length" : 1.4,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.9,
## 		"Sepal.Width" : 3.1,
## 		"Petal.Length" : 1.5,
## 		"Petal.Width" : 0.1,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.4,
## 		"Sepal.Width" : 3.7,
## 		"Petal.Length" : 1.5,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.8,
## 		"Sepal.Width" : 3.4,
## 		"Petal.Length" : 1.6,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.8,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 1.4,
## 		"Petal.Width" : 0.1,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.3,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 1.1,
## 		"Petal.Width" : 0.1,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.8,
## 		"Sepal.Width" : 4,
## 		"Petal.Length" : 1.2,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.7,
## 		"Sepal.Width" : 4.4,
## 		"Petal.Length" : 1.5,
## 		"Petal.Width" : 0.4,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.4,
## 		"Sepal.Width" : 3.9,
## 		"Petal.Length" : 1.3,
## 		"Petal.Width" : 0.4,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.1,
## 		"Sepal.Width" : 3.5,
## 		"Petal.Length" : 1.4,
## 		"Petal.Width" : 0.3,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.7,
## 		"Sepal.Width" : 3.8,
## 		"Petal.Length" : 1.7,
## 		"Petal.Width" : 0.3,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.1,
## 		"Sepal.Width" : 3.8,
## 		"Petal.Length" : 1.5,
## 		"Petal.Width" : 0.3,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.4,
## 		"Sepal.Width" : 3.4,
## 		"Petal.Length" : 1.7,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.1,
## 		"Sepal.Width" : 3.7,
## 		"Petal.Length" : 1.5,
## 		"Petal.Width" : 0.4,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.6,
## 		"Sepal.Width" : 3.6,
## 		"Petal.Length" : 1,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.1,
## 		"Sepal.Width" : 3.3,
## 		"Petal.Length" : 1.7,
## 		"Petal.Width" : 0.5,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.8,
## 		"Sepal.Width" : 3.4,
## 		"Petal.Length" : 1.9,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 1.6,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5,
## 		"Sepal.Width" : 3.4,
## 		"Petal.Length" : 1.6,
## 		"Petal.Width" : 0.4,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.2,
## 		"Sepal.Width" : 3.5,
## 		"Petal.Length" : 1.5,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.2,
## 		"Sepal.Width" : 3.4,
## 		"Petal.Length" : 1.4,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.7,
## 		"Sepal.Width" : 3.2,
## 		"Petal.Length" : 1.6,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.8,
## 		"Sepal.Width" : 3.1,
## 		"Petal.Length" : 1.6,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.4,
## 		"Sepal.Width" : 3.4,
## 		"Petal.Length" : 1.5,
## 		"Petal.Width" : 0.4,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.2,
## 		"Sepal.Width" : 4.1,
## 		"Petal.Length" : 1.5,
## 		"Petal.Width" : 0.1,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.5,
## 		"Sepal.Width" : 4.2,
## 		"Petal.Length" : 1.4,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.9,
## 		"Sepal.Width" : 3.1,
## 		"Petal.Length" : 1.5,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5,
## 		"Sepal.Width" : 3.2,
## 		"Petal.Length" : 1.2,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.5,
## 		"Sepal.Width" : 3.5,
## 		"Petal.Length" : 1.3,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.9,
## 		"Sepal.Width" : 3.6,
## 		"Petal.Length" : 1.4,
## 		"Petal.Width" : 0.1,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.4,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 1.3,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.1,
## 		"Sepal.Width" : 3.4,
## 		"Petal.Length" : 1.5,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5,
## 		"Sepal.Width" : 3.5,
## 		"Petal.Length" : 1.3,
## 		"Petal.Width" : 0.3,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.5,
## 		"Sepal.Width" : 2.3,
## 		"Petal.Length" : 1.3,
## 		"Petal.Width" : 0.3,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.4,
## 		"Sepal.Width" : 3.2,
## 		"Petal.Length" : 1.3,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5,
## 		"Sepal.Width" : 3.5,
## 		"Petal.Length" : 1.6,
## 		"Petal.Width" : 0.6,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.1,
## 		"Sepal.Width" : 3.8,
## 		"Petal.Length" : 1.9,
## 		"Petal.Width" : 0.4,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.8,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 1.4,
## 		"Petal.Width" : 0.3,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.1,
## 		"Sepal.Width" : 3.8,
## 		"Petal.Length" : 1.6,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 4.6,
## 		"Sepal.Width" : 3.2,
## 		"Petal.Length" : 1.4,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5.3,
## 		"Sepal.Width" : 3.7,
## 		"Petal.Length" : 1.5,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 5,
## 		"Sepal.Width" : 3.3,
## 		"Petal.Length" : 1.4,
## 		"Petal.Width" : 0.2,
## 		"Species" : "setosa"
## 	},
## 	{
## 		"Sepal.Length" : 7,
## 		"Sepal.Width" : 3.2,
## 		"Petal.Length" : 4.7,
## 		"Petal.Width" : 1.4,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.4,
## 		"Sepal.Width" : 3.2,
## 		"Petal.Length" : 4.5,
## 		"Petal.Width" : 1.5,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.9,
## 		"Sepal.Width" : 3.1,
## 		"Petal.Length" : 4.9,
## 		"Petal.Width" : 1.5,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.5,
## 		"Sepal.Width" : 2.3,
## 		"Petal.Length" : 4,
## 		"Petal.Width" : 1.3,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.5,
## 		"Sepal.Width" : 2.8,
## 		"Petal.Length" : 4.6,
## 		"Petal.Width" : 1.5,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.7,
## 		"Sepal.Width" : 2.8,
## 		"Petal.Length" : 4.5,
## 		"Petal.Width" : 1.3,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.3,
## 		"Sepal.Width" : 3.3,
## 		"Petal.Length" : 4.7,
## 		"Petal.Width" : 1.6,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 4.9,
## 		"Sepal.Width" : 2.4,
## 		"Petal.Length" : 3.3,
## 		"Petal.Width" : 1,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.6,
## 		"Sepal.Width" : 2.9,
## 		"Petal.Length" : 4.6,
## 		"Petal.Width" : 1.3,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.2,
## 		"Sepal.Width" : 2.7,
## 		"Petal.Length" : 3.9,
## 		"Petal.Width" : 1.4,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5,
## 		"Sepal.Width" : 2,
## 		"Petal.Length" : 3.5,
## 		"Petal.Width" : 1,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.9,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 4.2,
## 		"Petal.Width" : 1.5,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6,
## 		"Sepal.Width" : 2.2,
## 		"Petal.Length" : 4,
## 		"Petal.Width" : 1,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.1,
## 		"Sepal.Width" : 2.9,
## 		"Petal.Length" : 4.7,
## 		"Petal.Width" : 1.4,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.6,
## 		"Sepal.Width" : 2.9,
## 		"Petal.Length" : 3.6,
## 		"Petal.Width" : 1.3,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.7,
## 		"Sepal.Width" : 3.1,
## 		"Petal.Length" : 4.4,
## 		"Petal.Width" : 1.4,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.6,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 4.5,
## 		"Petal.Width" : 1.5,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.8,
## 		"Sepal.Width" : 2.7,
## 		"Petal.Length" : 4.1,
## 		"Petal.Width" : 1,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.2,
## 		"Sepal.Width" : 2.2,
## 		"Petal.Length" : 4.5,
## 		"Petal.Width" : 1.5,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.6,
## 		"Sepal.Width" : 2.5,
## 		"Petal.Length" : 3.9,
## 		"Petal.Width" : 1.1,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.9,
## 		"Sepal.Width" : 3.2,
## 		"Petal.Length" : 4.8,
## 		"Petal.Width" : 1.8,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.1,
## 		"Sepal.Width" : 2.8,
## 		"Petal.Length" : 4,
## 		"Petal.Width" : 1.3,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.3,
## 		"Sepal.Width" : 2.5,
## 		"Petal.Length" : 4.9,
## 		"Petal.Width" : 1.5,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.1,
## 		"Sepal.Width" : 2.8,
## 		"Petal.Length" : 4.7,
## 		"Petal.Width" : 1.2,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.4,
## 		"Sepal.Width" : 2.9,
## 		"Petal.Length" : 4.3,
## 		"Petal.Width" : 1.3,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.6,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 4.4,
## 		"Petal.Width" : 1.4,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.8,
## 		"Sepal.Width" : 2.8,
## 		"Petal.Length" : 4.8,
## 		"Petal.Width" : 1.4,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.7,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 5,
## 		"Petal.Width" : 1.7,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6,
## 		"Sepal.Width" : 2.9,
## 		"Petal.Length" : 4.5,
## 		"Petal.Width" : 1.5,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.7,
## 		"Sepal.Width" : 2.6,
## 		"Petal.Length" : 3.5,
## 		"Petal.Width" : 1,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.5,
## 		"Sepal.Width" : 2.4,
## 		"Petal.Length" : 3.8,
## 		"Petal.Width" : 1.1,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.5,
## 		"Sepal.Width" : 2.4,
## 		"Petal.Length" : 3.7,
## 		"Petal.Width" : 1,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.8,
## 		"Sepal.Width" : 2.7,
## 		"Petal.Length" : 3.9,
## 		"Petal.Width" : 1.2,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6,
## 		"Sepal.Width" : 2.7,
## 		"Petal.Length" : 5.1,
## 		"Petal.Width" : 1.6,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.4,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 4.5,
## 		"Petal.Width" : 1.5,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6,
## 		"Sepal.Width" : 3.4,
## 		"Petal.Length" : 4.5,
## 		"Petal.Width" : 1.6,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.7,
## 		"Sepal.Width" : 3.1,
## 		"Petal.Length" : 4.7,
## 		"Petal.Width" : 1.5,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.3,
## 		"Sepal.Width" : 2.3,
## 		"Petal.Length" : 4.4,
## 		"Petal.Width" : 1.3,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.6,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 4.1,
## 		"Petal.Width" : 1.3,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.5,
## 		"Sepal.Width" : 2.5,
## 		"Petal.Length" : 4,
## 		"Petal.Width" : 1.3,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.5,
## 		"Sepal.Width" : 2.6,
## 		"Petal.Length" : 4.4,
## 		"Petal.Width" : 1.2,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.1,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 4.6,
## 		"Petal.Width" : 1.4,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.8,
## 		"Sepal.Width" : 2.6,
## 		"Petal.Length" : 4,
## 		"Petal.Width" : 1.2,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5,
## 		"Sepal.Width" : 2.3,
## 		"Petal.Length" : 3.3,
## 		"Petal.Width" : 1,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.6,
## 		"Sepal.Width" : 2.7,
## 		"Petal.Length" : 4.2,
## 		"Petal.Width" : 1.3,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.7,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 4.2,
## 		"Petal.Width" : 1.2,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.7,
## 		"Sepal.Width" : 2.9,
## 		"Petal.Length" : 4.2,
## 		"Petal.Width" : 1.3,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.2,
## 		"Sepal.Width" : 2.9,
## 		"Petal.Length" : 4.3,
## 		"Petal.Width" : 1.3,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.1,
## 		"Sepal.Width" : 2.5,
## 		"Petal.Length" : 3,
## 		"Petal.Width" : 1.1,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 5.7,
## 		"Sepal.Width" : 2.8,
## 		"Petal.Length" : 4.1,
## 		"Petal.Width" : 1.3,
## 		"Species" : "versicolor"
## 	},
## 	{
## 		"Sepal.Length" : 6.3,
## 		"Sepal.Width" : 3.3,
## 		"Petal.Length" : 6,
## 		"Petal.Width" : 2.5,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 5.8,
## 		"Sepal.Width" : 2.7,
## 		"Petal.Length" : 5.1,
## 		"Petal.Width" : 1.9,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 7.1,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 5.9,
## 		"Petal.Width" : 2.1,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.3,
## 		"Sepal.Width" : 2.9,
## 		"Petal.Length" : 5.6,
## 		"Petal.Width" : 1.8,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.5,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 5.8,
## 		"Petal.Width" : 2.2,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 7.6,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 6.6,
## 		"Petal.Width" : 2.1,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 4.9,
## 		"Sepal.Width" : 2.5,
## 		"Petal.Length" : 4.5,
## 		"Petal.Width" : 1.7,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 7.3,
## 		"Sepal.Width" : 2.9,
## 		"Petal.Length" : 6.3,
## 		"Petal.Width" : 1.8,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.7,
## 		"Sepal.Width" : 2.5,
## 		"Petal.Length" : 5.8,
## 		"Petal.Width" : 1.8,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 7.2,
## 		"Sepal.Width" : 3.6,
## 		"Petal.Length" : 6.1,
## 		"Petal.Width" : 2.5,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.5,
## 		"Sepal.Width" : 3.2,
## 		"Petal.Length" : 5.1,
## 		"Petal.Width" : 2,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.4,
## 		"Sepal.Width" : 2.7,
## 		"Petal.Length" : 5.3,
## 		"Petal.Width" : 1.9,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.8,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 5.5,
## 		"Petal.Width" : 2.1,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 5.7,
## 		"Sepal.Width" : 2.5,
## 		"Petal.Length" : 5,
## 		"Petal.Width" : 2,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 5.8,
## 		"Sepal.Width" : 2.8,
## 		"Petal.Length" : 5.1,
## 		"Petal.Width" : 2.4,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.4,
## 		"Sepal.Width" : 3.2,
## 		"Petal.Length" : 5.3,
## 		"Petal.Width" : 2.3,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.5,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 5.5,
## 		"Petal.Width" : 1.8,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 7.7,
## 		"Sepal.Width" : 3.8,
## 		"Petal.Length" : 6.7,
## 		"Petal.Width" : 2.2,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 7.7,
## 		"Sepal.Width" : 2.6,
## 		"Petal.Length" : 6.9,
## 		"Petal.Width" : 2.3,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6,
## 		"Sepal.Width" : 2.2,
## 		"Petal.Length" : 5,
## 		"Petal.Width" : 1.5,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.9,
## 		"Sepal.Width" : 3.2,
## 		"Petal.Length" : 5.7,
## 		"Petal.Width" : 2.3,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 5.6,
## 		"Sepal.Width" : 2.8,
## 		"Petal.Length" : 4.9,
## 		"Petal.Width" : 2,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 7.7,
## 		"Sepal.Width" : 2.8,
## 		"Petal.Length" : 6.7,
## 		"Petal.Width" : 2,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.3,
## 		"Sepal.Width" : 2.7,
## 		"Petal.Length" : 4.9,
## 		"Petal.Width" : 1.8,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.7,
## 		"Sepal.Width" : 3.3,
## 		"Petal.Length" : 5.7,
## 		"Petal.Width" : 2.1,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 7.2,
## 		"Sepal.Width" : 3.2,
## 		"Petal.Length" : 6,
## 		"Petal.Width" : 1.8,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.2,
## 		"Sepal.Width" : 2.8,
## 		"Petal.Length" : 4.8,
## 		"Petal.Width" : 1.8,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.1,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 4.9,
## 		"Petal.Width" : 1.8,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.4,
## 		"Sepal.Width" : 2.8,
## 		"Petal.Length" : 5.6,
## 		"Petal.Width" : 2.1,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 7.2,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 5.8,
## 		"Petal.Width" : 1.6,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 7.4,
## 		"Sepal.Width" : 2.8,
## 		"Petal.Length" : 6.1,
## 		"Petal.Width" : 1.9,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 7.9,
## 		"Sepal.Width" : 3.8,
## 		"Petal.Length" : 6.4,
## 		"Petal.Width" : 2,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.4,
## 		"Sepal.Width" : 2.8,
## 		"Petal.Length" : 5.6,
## 		"Petal.Width" : 2.2,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.3,
## 		"Sepal.Width" : 2.8,
## 		"Petal.Length" : 5.1,
## 		"Petal.Width" : 1.5,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.1,
## 		"Sepal.Width" : 2.6,
## 		"Petal.Length" : 5.6,
## 		"Petal.Width" : 1.4,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 7.7,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 6.1,
## 		"Petal.Width" : 2.3,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.3,
## 		"Sepal.Width" : 3.4,
## 		"Petal.Length" : 5.6,
## 		"Petal.Width" : 2.4,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.4,
## 		"Sepal.Width" : 3.1,
## 		"Petal.Length" : 5.5,
## 		"Petal.Width" : 1.8,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 4.8,
## 		"Petal.Width" : 1.8,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.9,
## 		"Sepal.Width" : 3.1,
## 		"Petal.Length" : 5.4,
## 		"Petal.Width" : 2.1,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.7,
## 		"Sepal.Width" : 3.1,
## 		"Petal.Length" : 5.6,
## 		"Petal.Width" : 2.4,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.9,
## 		"Sepal.Width" : 3.1,
## 		"Petal.Length" : 5.1,
## 		"Petal.Width" : 2.3,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 5.8,
## 		"Sepal.Width" : 2.7,
## 		"Petal.Length" : 5.1,
## 		"Petal.Width" : 1.9,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.8,
## 		"Sepal.Width" : 3.2,
## 		"Petal.Length" : 5.9,
## 		"Petal.Width" : 2.3,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.7,
## 		"Sepal.Width" : 3.3,
## 		"Petal.Length" : 5.7,
## 		"Petal.Width" : 2.5,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.7,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 5.2,
## 		"Petal.Width" : 2.3,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.3,
## 		"Sepal.Width" : 2.5,
## 		"Petal.Length" : 5,
## 		"Petal.Width" : 1.9,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.5,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 5.2,
## 		"Petal.Width" : 2,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 6.2,
## 		"Sepal.Width" : 3.4,
## 		"Petal.Length" : 5.4,
## 		"Petal.Width" : 2.3,
## 		"Species" : "virginica"
## 	},
## 	{
## 		"Sepal.Length" : 5.9,
## 		"Sepal.Width" : 3,
## 		"Petal.Length" : 5.1,
## 		"Petal.Width" : 1.8,
## 		"Species" : "virginica"
## 	}
## ]
```


[http://www.r-bloggers.com/new-package-jsonlite-a-smarter-json-encoderdecoder/](http://www.r-bloggers.com/new-package-jsonlite-a-smarter-json-encoderdecoder/)


---

## Convert back to JSON


```r
iris2 <- fromJSON(myjson)
head(iris2)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```



[http://www.r-bloggers.com/new-package-jsonlite-a-smarter-json-encoderdecoder/](http://www.r-bloggers.com/new-package-jsonlite-a-smarter-json-encoderdecoder/)

---

## Further resources

* [http://www.json.org/](http://www.json.org/)
* A good tutorial on jsonlite - [http://www.r-bloggers.com/new-package-jsonlite-a-smarter-json-encoderdecoder/](http://www.r-bloggers.com/new-package-jsonlite-a-smarter-json-encoderdecoder/)
* [jsonlite vignette](http://cran.r-project.org/web/packages/jsonlite/vignettes/json-mapping.pdf)

---

## mySQL

* Free and widely used open source database software
* Widely used in internet based applications
* Data are structured in 
  * Databases
  * Tables within databases
  * Fields within tables
* Each row is called a record

[http://en.wikipedia.org/wiki/MySQL](http://en.wikipedia.org/wiki/MySQL)
[http://www.mysql.com/](http://www.mysql.com/)


---

## Example structure

<img class=center src=../../assets/img/03_ObtainingData/database-schema.png height=450>


[http://dev.mysql.com/doc/employee/en/sakila-structure.html](http://dev.mysql.com/doc/employee/en/sakila-structure.html)

---

## Step 1 - Install MySQL

<img class=center src=../../assets/img/03_ObtainingData/installmysql.png height=450>

[http://dev.mysql.com/doc/refman/5.7/en/installing.html](http://dev.mysql.com/doc/refman/5.7/en/installing.html)

---

## Step 2 - Install RMySQL

* On a Mac: ```install.packages("RMySQL")```
* On Windows: 
  * Official instructions - [http://biostat.mc.vanderbilt.edu/wiki/Main/RMySQL](http://biostat.mc.vanderbilt.edu/wiki/Main/RMySQL) (may be useful for Mac/UNIX users as well)
  * Potentially useful guide - [http://www.ahschulz.de/2013/07/23/installing-rmysql-under-windows/](http://www.ahschulz.de/2013/07/23/installing-rmysql-under-windows/)  


---

## Example - UCSC database


<img class=center src=../../assets/img/03_ObtainingData/ucsc.png height=450>

[http://genome.ucsc.edu/](http://genome.ucsc.edu/)



---

## UCSC MySQL


<img class=center src=../../assets/img/03_ObtainingData/ucscmysql.png height=450>

[http://genome.ucsc.edu/goldenPath/help/mysql.html](http://genome.ucsc.edu/goldenPath/help/mysql.html)


---

## Connecting and listing databases


```r
library(RMySQL)
ucscDb <- dbConnect(MySQL(), user = "genome", host = "genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;")
dbDisconnect(ucscDb)
```

```
## [1] TRUE
```

```r
result
```

```
##               Database
## 1   information_schema
## 2              ailMel1
## 3              allMis1
## 4              anoCar1
## 5              anoCar2
## 6              anoGam1
## 7              apiMel1
## 8              apiMel2
## 9              aplCal1
## 10             bosTau2
## 11             bosTau3
## 12             bosTau4
## 13             bosTau5
## 14             bosTau6
## 15             bosTau7
## 16           bosTauMd3
## 17             braFlo1
## 18             caeJap1
## 19              caePb1
## 20              caePb2
## 21             caeRem2
## 22             caeRem3
## 23             calJac1
## 24             calJac3
## 25             canFam1
## 26             canFam2
## 27             canFam3
## 28             cavPor3
## 29                 cb1
## 30                 cb3
## 31                ce10
## 32                 ce2
## 33                 ce4
## 34                 ce6
## 35             cerSim1
## 36             choHof1
## 37             chrPic1
## 38                 ci1
## 39                 ci2
## 40             danRer1
## 41             danRer2
## 42             danRer3
## 43             danRer4
## 44             danRer5
## 45             danRer6
## 46             danRer7
## 47             dasNov3
## 48             dipOrd1
## 49                 dm1
## 50                 dm2
## 51                 dm3
## 52                 dp2
## 53                 dp3
## 54             droAna1
## 55             droAna2
## 56             droEre1
## 57             droGri1
## 58             droMoj1
## 59             droMoj2
## 60             droPer1
## 61             droSec1
## 62             droSim1
## 63             droVir1
## 64             droVir2
## 65             droYak1
## 66             droYak2
## 67             echTel1
## 68             echTel2
## 69             equCab1
## 70             equCab2
## 71             eriEur1
## 72             felCat3
## 73             felCat4
## 74             felCat5
## 75                 fr1
## 76                 fr2
## 77                 fr3
## 78             gadMor1
## 79             galGal2
## 80             galGal3
## 81             galGal4
## 82             gasAcu1
## 83             geoFor1
## 84                  go
## 85            go080130
## 86             gorGor3
## 87             hetGla1
## 88             hetGla2
## 89                hg16
## 90                hg17
## 91                hg18
## 92                hg19
## 93         hg19Patch10
## 94          hg19Patch2
## 95          hg19Patch5
## 96          hg19Patch9
## 97             hgFixed
## 98              hgTemp
## 99           hgcentral
## 100            latCha1
## 101            loxAfr3
## 102            macEug1
## 103            macEug2
## 104            melGal1
## 105            melUnd1
## 106            micMur1
## 107               mm10
## 108         mm10Patch1
## 109                mm5
## 110                mm6
## 111                mm7
## 112                mm8
## 113                mm9
## 114            monDom1
## 115            monDom4
## 116            monDom5
## 117            musFur1
## 118            myoLuc2
## 119            nomLeu1
## 120            nomLeu2
## 121            nomLeu3
## 122            ochPri2
## 123            oreNil1
## 124            oreNil2
## 125            ornAna1
## 126            oryCun2
## 127            oryLat2
## 128            otoGar3
## 129            oviAri1
## 130            oviAri3
## 131            panTro1
## 132            panTro2
## 133            panTro3
## 134            panTro4
## 135            papAnu2
## 136            papHam1
## 137 performance_schema
## 138            petMar1
## 139            petMar2
## 140            ponAbe2
## 141            priPac1
## 142            proCap1
## 143     proteins120806
## 144     proteins121210
## 145           proteome
## 146            pteVam1
## 147            rheMac1
## 148            rheMac2
## 149            rheMac3
## 150                rn3
## 151                rn4
## 152                rn5
## 153            sacCer1
## 154            sacCer2
## 155            sacCer3
## 156            saiBol1
## 157            sarHar1
## 158            sorAra1
## 159           sp120323
## 160           sp121210
## 161            speTri2
## 162            strPur1
## 163            strPur2
## 164            susScr2
## 165            susScr3
## 166            taeGut1
## 167            tarSyr1
## 168               test
## 169            tetNig1
## 170            tetNig2
## 171            triMan1
## 172            tupBel1
## 173            turTru2
## 174            uniProt
## 175            vicPac1
## 176            vicPac2
## 177           visiGene
## 178            xenTro1
## 179            xenTro2
## 180            xenTro3
```



---

## Connecting to hg19 and listing tables


```r
hg19 <- dbConnect(MySQL(), user = "genome", db = "hg19", host = "genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
```

```
## [1] 10968
```

```r
allTables[1:5]
```

```
## [1] "HInv"         "HInvGeneMrna" "acembly"      "acemblyClass"
## [5] "acemblyPep"
```



---

## Get dimensions of a specific table


```r
dbListFields(hg19, "affyU133Plus2")
```

```
##  [1] "bin"         "matches"     "misMatches"  "repMatches"  "nCount"     
##  [6] "qNumInsert"  "qBaseInsert" "tNumInsert"  "tBaseInsert" "strand"     
## [11] "qName"       "qSize"       "qStart"      "qEnd"        "tName"      
## [16] "tSize"       "tStart"      "tEnd"        "blockCount"  "blockSizes" 
## [21] "qStarts"     "tStarts"
```

```r
dbGetQuery(hg19, "select count(*) from affyU133Plus2")
```

```
##   count(*)
## 1    58463
```



---

## Read from the table


```r
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)
```

```
##   bin matches misMatches repMatches nCount qNumInsert qBaseInsert
## 1 585     530          4          0     23          3          41
## 2 585    3355         17          0    109          9          67
## 3 585    4156         14          0     83         16          18
## 4 585    4667          9          0     68         21          42
## 5 585    5180         14          0    167         10          38
## 6 585     468          5          0     14          0           0
##   tNumInsert tBaseInsert strand        qName qSize qStart qEnd tName
## 1          3         898      -  225995_x_at   637      5  603  chr1
## 2          9       11621      -  225035_x_at  3635      0 3548  chr1
## 3          2          93      -  226340_x_at  4318      3 4274  chr1
## 4          3        5743      - 1557034_s_at  4834     48 4834  chr1
## 5          1          29      -    231811_at  5399      0 5399  chr1
## 6          0           0      -    236841_at   487      0  487  chr1
##       tSize tStart  tEnd blockCount
## 1 249250621  14361 15816          5
## 2 249250621  14381 29483         17
## 3 249250621  14399 18745         18
## 4 249250621  14406 24893         23
## 5 249250621  19688 25078         11
## 6 249250621  27542 28029          1
##                                                                   blockSizes
## 1                                                          93,144,229,70,21,
## 2              73,375,71,165,303,360,198,661,201,1,260,250,74,73,98,155,163,
## 3                 690,10,32,33,376,4,5,15,5,11,7,41,277,859,141,51,443,1253,
## 4 99,352,286,24,49,14,6,5,8,149,14,44,98,12,10,355,837,59,8,1500,133,624,58,
## 5                                       131,26,1300,6,4,11,4,7,358,3359,155,
## 6                                                                       487,
##                                                                                                  qStarts
## 1                                                                                    34,132,278,541,611,
## 2                        87,165,540,647,818,1123,1484,1682,2343,2545,2546,2808,3058,3133,3206,3317,3472,
## 3                   44,735,746,779,813,1190,1195,1201,1217,1223,1235,1243,1285,1564,2423,2565,2617,3062,
## 4 0,99,452,739,764,814,829,836,842,851,1001,1016,1061,1160,1173,1184,1540,2381,2441,2450,3951,4103,4728,
## 5                                                     0,132,159,1460,1467,1472,1484,1489,1497,1856,5244,
## 6                                                                                                     0,
##                                                                                                                                      tStarts
## 1                                                                                                             14361,14454,14599,14968,15795,
## 2                                     14381,14454,14969,15075,15240,15543,15903,16104,16853,17054,17232,17492,17914,17988,18267,24736,29320,
## 3                               14399,15089,15099,15131,15164,15540,15544,15549,15564,15569,15580,15587,15628,15906,16857,16998,17049,17492,
## 4 14406,20227,20579,20865,20889,20938,20952,20958,20963,20971,21120,21134,21178,21276,21288,21298,21653,22492,22551,22559,24059,24211,24835,
## 5                                                                         19688,19819,19845,21145,21151,21155,21166,21170,21177,21535,24923,
## 6                                                                                                                                     27542,
```



---

## Select a specific subset


```r
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query)
quantile(affyMis$misMatches)
```

```
##   0%  25%  50%  75% 100% 
##    1    1    2    2    3
```

```r
affyMisSmall <- fetch(query, n = 10)
dbClearResult(query)
```

```
## [1] TRUE
```

```r
dim(affyMisSmall)
```

```
## [1] 10 22
```


---

## Don't forget to close the connection!


```r
dbDisconnect(hg19)
```

```
## [1] TRUE
```


---

## Further resources

* RMySQL vignette [http://cran.r-project.org/web/packages/RMySQL/RMySQL.pdf](http://cran.r-project.org/web/packages/RMySQL/RMySQL.pdf)
* List of commands [http://www.pantz.org/software/mysql/mysqlcommands.html](http://www.pantz.org/software/mysql/mysqlcommands.html)
  * __Do not, do not, delete, add or join things from ensembl. Only select.__
  * In general be careful with mysql commands
* A nice blog post summarizing some other commands [http://www.r-bloggers.com/mysql-and-r/](http://www.r-bloggers.com/mysql-and-r/)


---

## Application programming interfaces


<img class=center src=../../assets/img/03_ObtainingData/twitter.png height= 450/>


[https://dev.twitter.com/docs/api/1/get/blocks/blocking](https://dev.twitter.com/docs/api/1/get/blocks/blocking)


---

## Creating an application

<img class=center src=../../assets/img/03_ObtainingData/twitterapp1.png height= 450/>

[https://dev.twitter.com/apps](https://dev.twitter.com/appsmyapp <- oauth_app("twitter", key = "TYrWFPkFAkn4G5BbkWINYw"))

---

## Creating an application

<img class=center src=../../assets/img/03_ObtainingData/twitterapp2.png height= 450/>


---

## Creating an application

<img class=center src=../../assets/img/03_ObtainingData/twitterapp3.png height= 450/>


---

## Accessing Twitter from R


```r
myapp = oauth_app("twitter", key = "yourConsumerKeyHere", secret = "yourConsumerSecretHere")
sig = sign_oauth1.0(myapp, token = "yourTokenHere", token_secret = "yourTokenSecretHere")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
```



---

## Converting the json object


```r
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1, 1:4]
```


```
                      created_at           id             id_str
1 Mon Jan 13 05:18:04 +0000 2014 4.225984e+17 422598398940684288
                                                                                                                                         text
1 Now that P. Norvig's regex golf IPython notebook hit Slashdot, let's see if our traffic spike tops the previous one: http://t.co/Vc6JhZXOo8
```


---

## How did I know what url to use?


<img class=center src=../../assets/img/03_ObtainingData/twitterurl.png height= 450/>

[https://dev.twitter.com/docs/api/1.1/get/search/tweets](https://dev.twitter.com/docs/api/1.1/get/search/tweets)

---

## In general look at the documentation


<img class=center src=../../assets/img/03_ObtainingData/twitterdocs.png height= 450/>

[https://dev.twitter.com/docs/api/1.1/overview](https://dev.twitter.com/docs/api/1.1/overview)



---

## In general look at the documentation


* httr allows `GET`, `POST`, `PUT`, `DELETE` requests if you are authorized
* You can authenticate with a user name or a password
* Most modern APIs use something like oauth
* httr works well with Facebook, Google, Twitter, Githb, etc. 

---

## data.table

* Inherets from data.frame
  * All functions that accept data.frame work on data.table
* Written in C so it is much faster
* Much, much faster at subsetting, group, and updating
 

---

## Create data tables just like data frames


```r
library(data.table)
DF = data.frame(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = rnorm(9))
head(DF, 3)
```

```
##          x y      z
## 1 -0.22587 a  1.404
## 2  0.48877 a  1.188
## 3 -0.03319 a -1.091
```

```r
DT = data.table(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = rnorm(9))
head(DT, 3)
```

```
##          x y       z
## 1:  0.5574 a  0.2009
## 2: -0.7512 a -0.6908
## 3: -0.4432 a  1.3534
```


---

## See all the data tables in memory


```r
tables()
```

```
##      NAME NROW MB COLS  KEY
## [1,] DT      9 1  x,y,z    
## Total: 1MB
```


---

## Subsetting rows


```r
DT[2, ]
```

```
##          x y       z
## 1: -0.7512 a -0.6908
```

```r
DT[DT$y == "a", ]
```

```
##          x y       z
## 1:  0.5574 a  0.2009
## 2: -0.7512 a -0.6908
## 3: -0.4432 a  1.3534
```


---

## Subsetting rows


```r
DT[c(2, 3)]
```

```
##          x y       z
## 1: -0.7512 a -0.6908
## 2: -0.4432 a  1.3534
```



---

## Subsetting columns!?


```r
DT[, c(2, 3)]
```

```
## [1] 2 3
```


---

## Column subsetting in data.table

* The subsetting function is modified for data.table
* The argument you pass after the comma is called an "expression"
* In R an expression is a collection of statements enclosed in curley brackets 

```r
{
    x = 1
    y = 2
}
k = {
    print(10)
    5
}
```

```
## [1] 10
```

```r
print(k)
```

```
## [1] 5
```


---

## Calculating values for variables with expressions


```r
DT[, list(mean(x), sum(z))]
```

```
##        V1    V2
## 1: 0.3451 6.433
```

```r
DT[, table(y)]
```

```
## y
## a b c 
## 3 3 3
```


---

## Adding new columns


```r
DT[, `:=`(w, z^2)]
```

```
##          x y        z        w
## 1:  0.5574 a  0.20093 0.040374
## 2: -0.7512 a -0.69080 0.477210
## 3: -0.4432 a  1.35341 1.831725
## 4:  2.2737 b  2.88915 8.347163
## 5:  1.8429 b -0.34011 0.115677
## 6:  0.6512 b  1.56115 2.437177
## 7: -0.2779 c  0.41189 0.169657
## 8: -1.0870 c -0.06439 0.004146
## 9:  0.3400 c  1.11129 1.234967
```



---

## Adding new columns


```r
DT2 <- DT
DT[, `:=`(y, 2)]
```

```
## Warning: Coerced 'double' RHS to 'character' to match the column's type;
## may have truncated precision. Either change the target column to 'double'
## first (by creating a new 'double' vector length 9 (nrows of entire table)
## and assign that; i.e. 'replace' column), or coerce RHS to 'character'
## (e.g. 1L, NA_[real|integer]_, as.*, etc) to make your intent clear and for
## speed. Or, set the column type correctly up front when you create the
## table and stick to it, please.
```

```
##          x y        z        w
## 1:  0.5574 2  0.20093 0.040374
## 2: -0.7512 2 -0.69080 0.477210
## 3: -0.4432 2  1.35341 1.831725
## 4:  2.2737 2  2.88915 8.347163
## 5:  1.8429 2 -0.34011 0.115677
## 6:  0.6512 2  1.56115 2.437177
## 7: -0.2779 2  0.41189 0.169657
## 8: -1.0870 2 -0.06439 0.004146
## 9:  0.3400 2  1.11129 1.234967
```


---

## Careful


```r
head(DT, n = 3)
```

```
##          x y       z       w
## 1:  0.5574 2  0.2009 0.04037
## 2: -0.7512 2 -0.6908 0.47721
## 3: -0.4432 2  1.3534 1.83172
```

```r
head(DT2, n = 3)
```

```
##          x y       z       w
## 1:  0.5574 2  0.2009 0.04037
## 2: -0.7512 2 -0.6908 0.47721
## 3: -0.4432 2  1.3534 1.83172
```



---

## Multiple operations


```r
DT[, `:=`(m, {
    tmp <- (x + z)
    log2(tmp + 5)
})]
```

```
##          x y        z        w     m
## 1:  0.5574 2  0.20093 0.040374 2.526
## 2: -0.7512 2 -0.69080 0.477210 1.831
## 3: -0.4432 2  1.35341 1.831725 2.563
## 4:  2.2737 2  2.88915 8.347163 3.345
## 5:  1.8429 2 -0.34011 0.115677 2.701
## 6:  0.6512 2  1.56115 2.437177 2.850
## 7: -0.2779 2  0.41189 0.169657 2.360
## 8: -1.0870 2 -0.06439 0.004146 1.944
## 9:  0.3400 2  1.11129 1.234967 2.690
```


---

## plyr like operations


```r
DT[, `:=`(a, x > 0)]
```

```
##          x y        z        w     m     a
## 1:  0.5574 2  0.20093 0.040374 2.526  TRUE
## 2: -0.7512 2 -0.69080 0.477210 1.831 FALSE
## 3: -0.4432 2  1.35341 1.831725 2.563 FALSE
## 4:  2.2737 2  2.88915 8.347163 3.345  TRUE
## 5:  1.8429 2 -0.34011 0.115677 2.701  TRUE
## 6:  0.6512 2  1.56115 2.437177 2.850  TRUE
## 7: -0.2779 2  0.41189 0.169657 2.360 FALSE
## 8: -1.0870 2 -0.06439 0.004146 1.944 FALSE
## 9:  0.3400 2  1.11129 1.234967 2.690  TRUE
```



---

## plyr like operations


```r
DT[, `:=`(b, mean(x + w)), by = a]
```

```
##          x y        z        w     m     a        b
## 1:  0.5574 2  0.20093 0.040374 2.526  TRUE  3.56813
## 2: -0.7512 2 -0.69080 0.477210 1.831 FALSE -0.01914
## 3: -0.4432 2  1.35341 1.831725 2.563 FALSE -0.01914
## 4:  2.2737 2  2.88915 8.347163 3.345  TRUE  3.56813
## 5:  1.8429 2 -0.34011 0.115677 2.701  TRUE  3.56813
## 6:  0.6512 2  1.56115 2.437177 2.850  TRUE  3.56813
## 7: -0.2779 2  0.41189 0.169657 2.360 FALSE -0.01914
## 8: -1.0870 2 -0.06439 0.004146 1.944 FALSE -0.01914
## 9:  0.3400 2  1.11129 1.234967 2.690  TRUE  3.56813
```



---

## Special variables

`.N` An integer, length 1, containing the numbe r


```r
set.seed(123)
DT <- data.table(x = sample(letters[1:3], 1e+05, TRUE))
DT[, .N, by = x]
```

```
##    x     N
## 1: a 33387
## 2: c 33201
## 3: b 33412
```


---

## Keys


```r
DT <- data.table(x = rep(c("a", "b", "c"), each = 100), y = rnorm(300))
setkey(DT, x)
DT["a"]
```

```
##      x        y
##   1: a  0.25959
##   2: a  0.91751
##   3: a -0.72232
##   4: a -0.80828
##   5: a -0.14135
##   6: a  2.25701
##   7: a -2.37955
##   8: a -0.45425
##   9: a -0.06007
##  10: a  0.86090
##  11: a -1.78466
##  12: a -0.13074
##  13: a -0.36984
##  14: a -0.18066
##  15: a -1.04973
##  16: a  0.37832
##  17: a -1.37079
##  18: a -0.31612
##  19: a  0.39435
##  20: a -1.68988
##  21: a -1.46234
##  22: a  2.55838
##  23: a  0.08789
##  24: a  1.73141
##  25: a  1.21513
##  26: a  0.29954
##  27: a -0.17246
##  28: a  1.13250
##  29: a  0.02320
##  30: a  1.33587
##  31: a -1.09879
##  32: a -0.58176
##  33: a  0.03892
##  34: a  1.07315
##  35: a  1.34970
##  36: a  1.19528
##  37: a -0.02218
##  38: a  0.69849
##  39: a  0.67241
##  40: a -0.79165
##  41: a -0.21791
##  42: a  0.02307
##  43: a  0.11539
##  44: a -0.27708
##  45: a  0.03688
##  46: a  0.47520
##  47: a  1.70749
##  48: a  1.07601
##  49: a -1.34571
##  50: a -1.44025
##  51: a -0.39393
##  52: a  0.58106
##  53: a -0.17079
##  54: a -0.90585
##  55: a  0.15621
##  56: a -0.37323
##  57: a -0.34587
##  58: a -0.35829
##  59: a -0.13307
##  60: a -0.08960
##  61: a  0.62793
##  62: a -1.42883
##  63: a  0.17255
##  64: a -0.79115
##  65: a  1.26204
##  66: a -0.26941
##  67: a  0.15698
##  68: a -0.76060
##  69: a  1.37060
##  70: a  0.03758
##  71: a  0.44949
##  72: a  2.78869
##  73: a -0.46849
##  74: a  1.01261
##  75: a -0.04374
##  76: a  1.40670
##  77: a  0.41993
##  78: a  0.31009
##  79: a  1.11905
##  80: a -1.29814
##  81: a -1.28248
##  82: a  1.65943
##  83: a  0.78375
##  84: a  0.57771
##  85: a -0.26725
##  86: a -0.64569
##  87: a -0.44953
##  88: a -0.82620
##  89: a  1.05504
##  90: a -0.87927
##  91: a -1.27713
##  92: a -0.63412
##  93: a  0.66470
##  94: a -0.50958
##  95: a  0.40736
##  96: a  1.67775
##  97: a -1.05206
##  98: a -0.63691
##  99: a  0.56539
## 100: a  0.38016
##      x        y
```


---

## Joins


```r
DT1 <- data.table(x = c("a", "a", "b", "dt1"), y = 1:4)
DT2 <- data.table(x = c("a", "b", "dt2"), z = 5:7)
setkey(DT1, x)
setkey(DT2, x)
merge(DT1, DT2)
```

```
##    x y z
## 1: a 1 5
## 2: a 2 5
## 3: b 3 6
```




---

## Fast reading


```r
big_df <- data.frame(x = rnorm(1e+06), y = rnorm(1e+06))
file <- tempfile()
write.table(big_df, file = file, row.names = FALSE, col.names = TRUE, sep = "\t", 
    quote = FALSE)
system.time(fread(file))
```

```
##    user  system elapsed 
##   0.788   0.009   0.797
```

```r
system.time(read.table(file, header = TRUE, sep = "\t"))
```

```
##    user  system elapsed 
##  25.925   0.081  26.010
```





---

## Summary and further reading

* The latest development version contains new functions like `melt` and `dcast` for data.tables 
  * [https://r-forge.r-project.org/scm/viewvc.php/pkg/NEWS?view=markup&root=datatable](https://r-forge.r-project.org/scm/viewvc.php/pkg/NEWS?view=markup&root=datatable)
* Here is a list of differences between data.table and data.frame
  * [http://stackoverflow.com/questions/13618488/what-you-can-do-with-data-frame-that-you-cant-in-data-table](http://stackoverflow.com/questions/13618488/what-you-can-do-with-data-frame-that-you-cant-in-data-table)
* Notes based on Raphael Gottardo's notes [https://github.com/raphg/Biostat-578/blob/master/Advanced_data_manipulation.Rpres](https://github.com/raphg/Biostat-578/blob/master/Advanced_data_manipulation.Rpres), who got them from Kevin Ushey.
  
