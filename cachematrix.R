## Put comments here that give an overall description of what your
## functions do

## The first function, makeVector creates a special "vector", 
## which is really a matrix containing a function to
## to set and get the value of a vector, set and get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL ##set the matrix to NULL
        
        set <- function(y) { ## create a setter that caches x and m
                x <<- y
                m <<- NULL
        }
        get <- function() x create a getter that returns the cached x
        setinv.matrix <- function(solve) m <<- solve 
        getinv.matrix <- function() m
        list(set = set, get = get,
             setinv.matrix = setinvmatrix,
             getinv.matrix = getinv.matrix)
}


## The following function calculates the INVERSE of the matrix created with the above function. 
## However, it first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the matrix and sets the value in the cache via the setinv.matrix function.

cacheSolve <- function(x, ...) { ## Return a matrix that is the inverse of 'x' only if it not cached
        m <- x$getinv.matrix()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv.matrix(m)
        m
}
