## Caching the Inverse of a Matrix:
## Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than compute it repeatedly.
## Below are a pair of functions that are used to create a special object that 
## stores a matrix and caches its inverse.

## This first function creates a special "matrix" object that can cache its inverse.
## makeCacheMatrix returns a list that contains four functions:
# set: saves the input y (the matrix in this application) in the parent environment
#      and also sets the inverse to NULL which overwrites any previous inverses.
#      This leads to a recalculation of the inverse when a new matrix is set
#      because cacheSolve checks if inv is NULL.
# get: returns the the matrix
# setinverse: saves the result of the calculation (which should typically be the input)
#             in the parent environment as the object inv.
# getinverse: returns inv (can be NULL)

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse 
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## This second function computes the inverse of the special "matrix" created by 
## makeCacheMatrix above.
# cacheSolve first checks if the inverse can be found in the cache.
# If it can be found the function just returns that value and the message "getting
# cached data". Otherwise the inverse is calculated, saved using setinverse and
# returned.


cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}

# Solve example
example <- matrix(c(1:4),2,2)

example_1 <- makeCacheMatrix(example)
cacheSolve(example_1)

