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
# 03.03 - RandomPermutations
# Return a random permutation of a vector of n elements
# ------------------------------------------------------------------------------

function myShuffle(a)
    #return shuffle(a) # library code in Julia
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

while true
    print("Please specify the number of integers in the array [0 to exit, default: 5] ? ")
    n = 5
    rawinput = readline()
    rawinput = chomp(rawinput)
    if rawinput != ""
         n = parse(Int, rawinput)
    end
    if n == 0
        break
    end

    v = collect(1:n)
    print("Shuffled array: ")
    println(myShuffle(v))
end
