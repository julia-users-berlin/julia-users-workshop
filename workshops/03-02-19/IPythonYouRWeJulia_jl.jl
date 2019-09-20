
# Cells that are commented out ( that is, starting with `#` ) are supposed to be run once, if the cells underneath are not running correctly.

## using Pkg
## pkg"add PyCall RCall"
#----------------------------------------------------------------------------

# This is loading the `PyCall` and `RCall` packages.

using PyCall,RCall;
#----------------------------------------------------------------------------

# We can inspect the names exported by a Package with the `names` function. We use the `show` function to view the full output instead of the truncated one.

show(names(RCall))
#----------------------------------------------------------------------------

# The documentation string of a function can be viewed by prefixing a `?`

?@rput
#----------------------------------------------------------------------------

# ## Using Python from Julia 

# Python code can be written via the python string macro ( `@py_str` ) as shown below.

py"""
def fib(n):
    if n<2:
        return 1
    x,y = 1,1
    for i in range(n-2):
        x,y = y,x+y
    return y
"""
#----------------------------------------------------------------------------

# Python libraries can be imported in julia via the `@pyimport` macro.

@pyimport numpy
#----------------------------------------------------------------------------

##Pkg.add("PyPlot");
#----------------------------------------------------------------------------

using PyPlot ## that's using matplotlib from julia
#----------------------------------------------------------------------------

# The multiline string version ( `py""" ... """` ) does return `nothing` whereas the inline string version  ( `py" ... "` ) returns the last expression.

py"""
import numpy as np
X = np.arange(1,30)
Y = np.array([fib(x) for x in X])
ax.scatter(X, Y)
ax.set(xlabel='n', ylabel='fib(n)',
       title='The Fibonacci sequence grows fast !')
"""
X, Y = py"X", py"Y"
function fibplot( x, y )
    scatter( x, y )
    xlabel("n")
    ylabel("fib(n)")
    title("The Fibonacci sequence grows fast !")
end
fibplot( X, Y );
#----------------------------------------------------------------------------

# ## Using R from Julia
# Here we are passing the arrays that we created with python and plotted in Julia to R

@rput X Y;
#----------------------------------------------------------------------------

R"""
my_summary = summary(lm(log(Y)~X))
val <- my_summary$coefficients

plot(X, log(Y))
abline(my_summary)
""";
#----------------------------------------------------------------------------

# ## Writing, compiling and executing C from Julia

# And now we write and compile the same function in C and wrap it in Julia

## Pkg.add("Libdl")
using Libdl
C_code = """
int cfib(int n)
{
    int res=0;
    if (n <= 2){  
        res = 1;
    } else {
        res = cfib(n-1)+cfib(n-2);
    }
    return res;
}
"""

const Clib = tempname()   ## make a temporary file


## compile to a shared library by piping C_code to gcc
## (works only if you have gcc installed):

open(`gcc -fPIC -O3 -msse3 -xc -shared -o $(Clib * "." * Libdl.dlext) -`, "w") do f
    print(f, C_code) 
end

## define a Julia function that calls the C function:
c_fib(X::Int) = ccall(("cfib", Clib), Int, (Int,), X)
#----------------------------------------------------------------------------

x = 1:30
y = [c_fib(ξ) for ξ in x] ## ξ is \xi<tab>
fibplot( x, y );
#----------------------------------------------------------------------------
