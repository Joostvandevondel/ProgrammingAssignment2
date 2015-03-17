## Put comments here that give an overall description of what your
## functions do


## Function makeCacheMatrix creates a special "vector", which is really a list containing ## a function to do the following 
## + set the value of a matrix
## + get the value of a matrix
## + set the inverse value of that matrix
## + get the inverse value of that matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL  set <- function(y){    x <<- y    m <<- NULL  }  get <- function() x  setmatrix <- function(solve) m <<- solve  getmatrix <- function() m  list(set = set, get = get,       setmatrix = setmatrix,       getmatrix = getmatrix)

}

## The function cacheSolve calculates the inverse of the special matrix created
## with the  function makeCacheMatrix. However, it first checks to see if 
## the inverse matrix has already been calculated. If so, it gets the inverse matrix 
## from the cache and skips the computation. Otherwise, it calculates the 
## inverse of the matrix and sets the inverse value in the cache 
## via the setmatrix function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getmatrix()  if (!is.null(m)) {    message("getting cached data")    return(m)  }  matrix <- x$get()  m <- solve(matrix, ...)  x$setmatrix(m)  m
}

## Example
## x <- matrix(c(1,2,12,13), nrow = 2, ncol = 2)
## mm <- makeCacheMatrix(x)
## see if x is stored correctly in mm
## mm$get()
## cacheSolve(mm) sets inverse matrix of x
## check by following command
## mm$getmatrix()
## run second time cacheSolve(mm)
## message is printed “getting cached data”
