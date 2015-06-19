## makeCacheMatrix assigns four functions that set/get matrix/inverse
## matrix value to/from cache. cacheSolve returns the cached value for
## the inverse matrix or, if one is not cached, calculates the inverse
## matrix and caches it before returning the value.

## Sample invertible matrix, matrix(c(2,2,3,2),nrow=2,ncol=2)
## Evaluates to matrix(c(-1,1,1.5,-1.0),nrow=2,ncol=2) using solve(x)

## Through assignment to a variable, this function assigns a list
## of functions that can be called.
## Example steps/use:
##   1. a <- makeCacheMatrix()
##   2. a$set(matrix(values,nrow,ncol))
makeCacheMatrix <- function(x = matrix()) {
  ## Initialize m variable
  m <- NULL
  
  ## Set cached matrix to the value in the function call.
  ## The matrix is assumed to be new and so the cache value
  ## of the inverse matrix variable, m, is set to NULL.
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  ## Returns the cached matrix value. 
  get <- function() x
  
  ## Sets the cache value of the inverse matrix variable, m,
  ## as the inverse matrix.
  setinverse <- function(solve) m <<- solve
  
  ## Gets the cached inverse value, m
  getinverse <- function() m
  
  ## Returns the list of functions and their returns
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Using a variable that has been assigned the list 
## from makeCacheMatrix() this function returns the
## cached inverse matrix or, if nothing cached, the
## function determines the inverse matrix and caches
## that value.
## Example Step/Use:
##   1. cacheSolve(a)
cacheSolve <- function(x, ...) {
  ## Assign the cached inverse matrix value to m
  m <- x$getinverse()
  
  ## If m has a value then print the message and 
  ## return the inverse value, m
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  ## Assign the cached matrix to the variable matrix.
  matrix <- x$get()
  
  ## Assign the inverse matrix to m
  m <- solve(matrix, ...)
  
  ## Cache the inverse matrix from the previous step.
  x$setinverse(m)
  
  ## Return inverse matrix variable, m
  m
}
