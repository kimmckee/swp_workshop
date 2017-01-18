download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "gapminder-FiveYearData.csv")
gapminder <- read.csv("gapminder-FiveYearData.csv")
head (gapminder)
colnames (gapminder)
#Provides an overview of the structure/contents (# of obs and variable names/ types)
str (gapminder)
# Factor is for categorical variables
# integer is similar to NUM but integer values
nrow (gapminder)
ncol (gapminder)
# rows and columns
dim (gapminder)
# provides min max, mean and freq of categorical values
summary (gapminder)
#View opens up the dataset
View (gapminder)
#gapminder [row,column] LEFT ROW, RIGHT COLUMN
gapminder [,"pop" ]
gapminder [ , "country", "year", "pop"]
gapminder$lifeExp
# First five rows
gapminder [1:5,]
is_long_lifeExp <- gapminder$lifeExp > 80
head (is_long_lifeExp)
gapminder [is_long_lifeExp, ]
# life expect in Africa in 2007
# step 1: 2007 data
#step 2: get Africa data
lifeExp (year) <- c (continent "africa")
#step 3: get life exp
is_2007 <- gapminder$year ==2007
is_Africa <- gapminder$continent == "Africa"
africa_2007 <- gapminder [is_2007 & is_Africa, c ("country", "lifeExp")]

# Order data by lifeExp
o <- order (africa_2007$lifeExp)
africa_2007[o,]

# Making a plot (Geometry is a point)
ggplot (data= gapminder, aes (x=gdpPercap, y=lifeExp)) + geom_point ()

#Plot lifeExp by year, Color indicates continent
ggplot (data=gapminder, aes (x=year, y=lifeExp, 
                             by=country, color=continent)) + 
   geom_point(aes(size= gdpPercap))

# Color them by continent and size by population
ggplot (data=gapminder, aes (x=gdpPercap, y=lifeExp, 
                             by=country, color=continent)) +
 geom_point (aes(size= pop))
