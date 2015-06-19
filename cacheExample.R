## Example of caching using vectors and mean (credit: Roger D. Peng)
## From the instructions in PRogramming Assignment 2 of R Programming.

## This file exists so I can comment and notate what each part is doing.
## This is to better understand concepts and flow.

makeVector <- function(x = numeric()) {
  ## Initialize m
  m <- NULL
  
  ## Set Cache value of x as y
  ## Set cache value of m as NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  ## Returns the value of x
  get <- function() x
  
  ## Sets the cache value of m as the mean
  setmean <- function(mean) m <<- mean
  
  ## Gets the value of m
  getmean <- function() m
  
  ## Returns the list of functions and their returns
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

## Takes makeVector(x) function as the argument x
## Example is cachemean(makeVector(1:10))
cachemean <- function(x, ...) {
  ## Assign the cached mean value to m
  m <- x$getmean()
  
  ## If m has a value then return the value
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  ## Assign the cached vector to data
  data <- x$get()
  
  ## Assign the mean of data to m
  m <- mean(data, ...)
  
  ## Set the cached mean value of m
  x$setmean(m)
  
  ## Return m
  m
}