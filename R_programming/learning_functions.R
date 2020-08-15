add2 <- function(x,y) {
      x+y
}

add2(3,5)

above10<- function(x) {
      use <- x>10
      x[use]
}

above <- function(x,n=10 ) {
      ##= means you put default number
      use<-x>n
      x[use]
}

x<-1:20
above(x,3)

columnmean<-function(x, removeNA=T) {
      nc <- ncol(x)
      means <- numeric(nc) #zero vector
      for(i in 1:nc) {
            means[i]<-mean(x[,i], na.rm=removeNA)
      }
      means
}

columnmean(airquality)


##coding standards

#1. always write code using text editor and text files.
#2. indent your code.
#3. limit the width of your code. (about 80 columns?)
#4. limit the length of inidividual functions. (just one basic avctivities..)


##date and times.

x<- as.Date("1970-01-01")
x

x<- Sys.time()
x

p<-as.POSIXlt(x)
names(unclass(p))

p$sec
cube<-function(x,n) {
      x^3
}

cube(3)
