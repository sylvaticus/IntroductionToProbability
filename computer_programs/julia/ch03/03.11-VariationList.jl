################################################################################
## Algorithms for the Grinstead & Snell Introduction to probability (1997) book
################################################################################
#
# This code is copyright 2017 of Antonello Lobianco, released under the MIT
# licence and freely available at:
# https://github.com/sylvaticus/IntroductionToProbability
#
# The book is copyright of the American Mathematical Society, released under
# the GNU Free Documentation Licence (FDL) and freely available at the same
# github repository.
#
# The original home-page of the book seems no-longer maintained but it is still
# available at:
# http://www.dartmouth.edu/~chance/teaching_aids/books_articles/probability_book
# /book.html
#
# This code is written in the Julia Language.
# Download a free interpreter for your Operating System on http://julialang.org
# Learn to code in Julia using a concise tutorial:
# https://www.gitbook.com/book/sylvaticus/julia-language-a-concise-tutorial/
#
# If this script requires some non-core Julia packages, you can add them running
# (only once) `Pkg.add("PkgName")`
#
# ------------------------------------------------------------------------------
# 03.11 - VariationList
# Comute and plot the distance to the random process of multiple shufflings -
# the variation distance between distribution function of multiple shufflings
# and the uniform distribution.
# ------------------------------------------------------------------------------

println("Distance to the random process")
using StatsBase, Plots
#unicodeplots()
#pyplot() # for better charts

N = 52       # cards in the deck
maxS = 20    # show data up to these shuffles

function eulerianNumber(n::BigInt,a::BigInt) # Version from the book's recursive formula.. correct but too slow
    if a == 1
        return 1
    end
    toReturn = a^n
    for r in 1:a-1
        #println("a -r: $a - $r")
        toReturn -= (binomial(n+a-r,n) * eulerianNumber(n,r))
    end
    return toReturn
end

function eulerianNumber2(n::BigInt,m::BigInt) # Version from explicit formula in wikipedia. Fast but different definition ( A(n,m) = A(n,m+1) )
    toReturn = big(0)
    for k in 0:m+1
        toReturn +=  (-1)^k * binomial(n+1,k) * (m+1-k)^n
    end
    return toReturn
end

function eulerianNumber3(n::BigInt,a::BigInt) # Version from explicit formula adapted to the book's definition
    m = a-1
    toReturn = big(0)
    for k in 0:m+1
        toReturn +=  (-1)^k * binomial(n+1,k) * (m+1-k)^n
    end
    return toReturn
end

function distance(n::BigInt,s::BigInt)
    toReturn = 0.0
    for r in 1:n
        toReturn += eulerianNumber3(big(n),big(r)) * abs(binomial(big((2^s)+n-r), big(n))/big(2^(n*s)) - (1/factorial(big(n)) ))
    end
    return toReturn/2.0
end

# Computing the distances
dists = []
for i in 1:maxS
    push!(dists,Float32(distance(big(N),big(i))))
end

# Plotting the table
println("Number of Riffle Shuffle Variation Distance")
for i in 1:maxS
    println("$i \t\t\t $(dists[i])")
end

# Plotting the Plot
scatter(1:maxS,dists, label="Distance to the random process (n=$N)")
gui()
