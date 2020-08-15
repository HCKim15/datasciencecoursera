x<-1

print(x)

msg<-"hello"

msg

# hash tag is used for comment

x<-5 ## nothing happens.

x # auto-printing occurs

print(x) #explicit printing

x<-1:20
x

1 # integer
1L # explicitly gives you an integer.

1/0 #this is infinity

1/inf # this gives 0

0/0 # This is NaN.



## Vectors and lists.

x<-c(0.5, 0.6) ##numeric

x<- c(TRUE, FALSE) #logic vector
x<-c(T,F)

x<-c("a", "b","b")

x<- 9:29 # integer

x<-c(1+0i, 2+4i) # complex

y<-c(1.7, "a") # character

y<-c(T,2) # numeric

y<-c("a", T)

#every element of vector must be of same class

#there is also explicit coercion
x<-0:6
class(x)

as.numeric(x)
class(x)
as.logical(x)
class(x)
as.character(x)
class(x)


x<-c("a","b")
as.numeric(x)
# this give us NAs.. no coercion occurs.

##list.

#list can have different classes.

x<-list(1, "a", T, 1+4i)
x

#Matricies : special type of vector. has dimension attributes.

m<-matrix(nrow=2, ncol=3)

m

dim(m)
attributes(m)

m<-matrix(1:6, nrow=2, ncol=3) # it is filled columnwise.
m

m<-1:10
m

dim(m)<-c(2,5)

m

#cbinding, rbind-ing
x<-1:3
y<-10:12

cbind(x,y)
rbind(x,y)

#data type: factors

x<-factor(c("yes", "yes", "no", "yes", "no"))
x

table(x)

#missing values

x<-c(1,2,NA,10,3)
is.na(x)

is.nan(x)

x<-c(1,2,NaN, NA, 4)
is.na(x)
is.nan(x)

#dataframe
#used to store tabular data.

read.table() 
read.csv()

x<-data.frame(foo=1:4, bar=c(T,T,F,F))
x

nrow(x)
ncol(x)

#names attribute
x<-1:2
names(x)

names(x)<-c("foo", "bar", "norf")
names(x)

#reading tabular data
read.table()
read.csv()

read.table(file, header=T/F, sep=",", nrows=..)

data<-read.table("foo.txt")

#reading larger datasets with read.table
help(read.table)



#subsetting - basics

[
[[
$ 
  
x<-c("a","b","c","c")
x[1]
x[2]
x[1:4]
x[x>"a"]
u<-x>"a"
u
x[u]

#subsetting -lists

x<-list(foo=1:4, bar=0.6)
x[1]
x[[1]]
x

x$bar
x[["bar"]]
x["bar"]

x<-list(foo=1:3, bar=0.6, baz="hello")
x[c(1,3)]

name<-"foo"
x[[name]]
x$name #does not work.

#subsetting matrix.

x<-matrix(1:6, 2,3)
x[1,2]
x[1,]
x[,2]

x<-matrix(1:6, 2, 3)
x[1,2]
x[1,2, drop=F]

x<-matrix(1:6,2,3)
x[1,]
x[1, , drop=F]

#partial matching

x<-list(aardvark=1:5)
x$a

#removing missing values
x<-c(1,2, NA, 4, NA, 5)
bad<-is.na(x)
x[!bad]

y<-c("a", "b", NA, "d", NA, "f")
good<-complete.cases(x,y)
good
x[good]

airquality[1:6,]
good<-complete.cases(airquality)
airquality[good,][1:6,]

airquality[1:2,]

nrow(airquality)

airquality[152:153,]
airquality[47,"Ozone"]
bad<-is.na(airquality[,"Ozone"])
mean(airquality[!bad,][,1])
x<-1:4
y<-2
x+y
class(x+y)
max(airquality[,"Month"==5])
mean(airquality[,"Ozone"])