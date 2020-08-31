getwd()
[1] "/Users/himawari"
> setwd("Desktop/coding-works/R_seminar/cleaning_data")
> getwd()
[1] "/Users/himawari/Desktop/coding-works/R_seminar/cleaning_data"


#downloading files

fireUrl<- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
> download.file(fireUrl, destfile="cameras.csv", method="curl")
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
Dload  Upload   Total   Spent    Left  Speed
0     0    0     0    0     0      0      0 --:--:-- -100  9927    0  9927    0     0   6780      0 --:--:--  0:00:01 --:--:--  6780
> list.files()
[1] "cameras.csv"
> 
      
dateDownloaded<-date()
dateDownloaded

# making directories

if(!file.exists("directory name")) {
      dir.create("directory name")
}

## reading local flat files

cameraData<-read.table("./cameras.csv")
cameraData<-read.table("./cameras.csv", sep=",", header=T)

head(cameraData)

cameraData<-read.csv("./cameras.csv")

#reading excel files

setwd("Desktop/coding-works/R_seminar/cleaning_data")
if(!file.exists("data")) {dir.create("data")}

fileUrl <-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD&bom=true&format=true"

download.file(fileUrl, destfile="./data/cameras.xlsx", method="curl")
dataDownloaded<-data()


install.packages("xlsx")

library(xlsx)
cameraData<-read.xlsx("./data/cameras.xlsx", sheetIndex=1, header=T)
head(cameraData)


#reading XML

library(XML)
fileUrl<-"http://www.w3schools.com/xml/simple.xml"
doc<-xmlTreeParse(fileUrl,useInternal=T)
rootNode<-xmlRoot(doc)
xmlName(rootNode)

names(rootNode)

#directly access parts of the XML document
rootNode[1]
rootNode[[1]][[1]]

xmlSApply(rootNode,xmlValue)

# reading JSON

library(jsonlite)
jsonData<-fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)

names(jsonData$owner)

jasonData$owner$login

#writing data frames to JSON
myjson<-toJSON(iris, pretty=T)
cat(myjson)

#convert back to JSON
iris2<-fromJSON(myjson)
head(iris2)

#the data.table package

library(data.table)
DF=data.frame(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))
head(DF,3)

tables()

DT[2,]

DT[DT$y=="a",]

DT[c(2,3)] #subset based on the rows.


DT[,list(mean(x), sum(z))]
DT[,table(y)]

DT[,w:=z^2]


#mysql

install.packages("RMySQL")

uscsDb<-dbConnect(MySQL()user="genome", host="genome-mysql.cse.ucsc.edu")
result<-dbGetQuery(ucscDb, "show databases"); dbDisconnect(ucscDb);

hg19<-dbConnect(MySQL(),user="genome", db="hg19", host="genome-mysql.csc.ucsc.edu")
allTables<-dbListTables(hg19)
length(allTables)

query<-dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis<-fetch(query); quantile(affyMis$misMatches)

dbDisconnect(hg19)





