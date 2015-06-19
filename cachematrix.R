## Put comments here that give an overall description of what your
## functions do

## Sample invertible matrix, matrix(c(2,2,3,2),nrow=2,ncol=2)
## Evaluates to matrix(c(-1,1,1.5,-1.0),nrow=2,ncol=2) using solve(x)

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
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
  
  ## Sets the cache value of m as the inverse matrix
  setinverse <- function(solve) m <<- solve
  
  ## Gets the value of m
  getinverse <- function() m
  
  ## Returns the list of functions and their returns
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Assign the cached mean value to m
  m <- x$getinverse()
  
  ## If m has a value then return the value
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  ## Assign the cached vector to data
  matrix <- x$get()
  
  ## Assign the inverse matrix to m
  m <- solve(matrix, ...)
  
  ## Set the inverse matrix, m, to cache
  x$setinverse(m)
  
  ## Return m
  m
}
