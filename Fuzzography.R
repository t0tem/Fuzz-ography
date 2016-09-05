
# x <- readLines("Data_small.txt")
y <- readLines("Data.txt")
y[2794889]

#check that 1sy symbol is always "'"
z<-substr(y,1,1)
table(z)

#check that last symbol is always "'"
zz <- substr(y,nchar(y),nchar(y))
table(zz)

#remove 1st and last symbol
y <- substr(y,2,nchar(y)-1)

#remove 1st line
y <- y[-1]


#check that combination "'|'" is present ony once in each record
st <- "'\\|'"
a <- gregexpr(st, y)
aa <- sapply(a, length)
rm(a) #clear memory
max(aa)
table(aa)

#make data.frame
y.df <- as.data.frame(y, stringsAsFactors=F)


#load library to use tidyr::separate
library(tidyr)

#split data frame in 2 columns
y.df2 <- tidyr::separate(y.df, y, c("City", "CountryCode"), "'\\|'", fill = "left")
y.df2[2514370:2514390,]

y.df2[2514374,1] == ""

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

months.regex <- paste(month.name, collapse='|')
d <- gsub(paste0(".*(", months.regex, ")"), "\\1", 
          b[grep(months.regex, b, TRUE)], TRUE)

paste0(".*(", months.regex, ")")
