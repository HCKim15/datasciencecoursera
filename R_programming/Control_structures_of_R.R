# if-and else

if(x>3) {
  y<-10
} else {
  y<-0
}

y<- if(x>3) {
  10
} else {
  0
}

if(condition) {
  
}


#loop

for(i in 1:10) {
  print(i)
}

x<-c("a","b","c","d")

for(i in 1:4) {
  print(x[i])
}

for(i in seq_along(x)) {
  print(x[i])
}

for(letter in x) {
  print(letter)
}


for(i in 1:4) print(x[i])


x<-matrix(1:6, 2, 3)

for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i,j])
  }
}

#while loop

count<-0
while(count<10) {
  print(count)
  count<-count+1
}

z<-5

while(z>=3 && z<=10) {
  print(z)
  coin<-rbinom(1,1,0.5)
  
  if(coin==1) { ##random walk
    z<-z+1
  } else {
    z<-z-1
  }
  
}

help(rbinom)


#repeat, next, break

x0<-1
tol<- le-8

repeat {
  x1<-computeExtimate()
  
  if(abs(x1)<tol) {
    break
  } else {
    x0<-x1
  }
}

for(i in 1:100) {
  if(i<=20) {
    ##skip the first 20 iterations
    next
    
  }
  ##do sth here.
}
