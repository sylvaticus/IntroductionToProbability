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
# 03.04 - FixedPoints
# Compute by simulation the probability to get fixed points in random permutations
# ------------------------------------------------------------------------------

function myShuffle(a)
    #return shuffle(a)
    a2 = copy(a)
    l = length(a2)
    o = []
    for i in 1:l
        li = length(a2)
        pos = Int(floor(li* rand()) + 1) # --> [1,li]
        push!(o,a2[pos])
        deleteat!(a2, pos)
    end
    return o
end

function computeFixedPoints(a,b)
    fp = 0
    for i in 1:length(a)
        if(a[i] == b[i])
            fp += 1
        end
    end
    return fp
end

tests = 50000
while true
    print("Please specify the number of integers in the array [0 to exit, default: 10] ? ")
    n = 10
    rawinput = readline()
    rawinput = chomp(rawinput)
    if rawinput != ""
         n = parse(Int, rawinput)
    end
    if n == 0
        break
    end

    v = collect(1:n)
    fixedPoints = zeros(Int64,n+1)
    for i in 1:tests
        shuffledV = myShuffle(v)
        fp = computeFixedPoints(v,shuffledV) #[0,n]
        fixedPoints[fp+1] += 1
    end
    println("---- Results (n = $n, repetitions = $tests): ----")
    println("Number of fixed points \t Fraction of permutations")
    for i in 1:n+1
        pr = fixedPoints[i] / tests
        println("$(i-1) \t\t $pr")
    end
    counter = sum([(i-1) * fixedPoints[i] for i in 1:n+1])
    avg = counter/tests
    println("Average number of fixed points: $avg")
end
