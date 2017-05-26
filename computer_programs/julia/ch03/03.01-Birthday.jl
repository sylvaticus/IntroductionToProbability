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
# 03.01 - Birthday
# Compute the probabilities that no-one is sharing the same birthday given a
# group of n people
# ------------------------------------------------------------------------------

print("Sizes of the groups for which probabilities should be computed (please specify a range in the form Start:Step:End, default to 20:1:25) ? ")
rawinput = readline()
rawinput = chomp(rawinput)
groups = []
if rawinput == ""
    groups = collect(20:1:25)
else
    groups= collect(eval(parse(rawinput)))
end

tests = 50000

println("Probabilities that all birthdays are different (computed values / simulated values [$tests repetitions]):")
for g in groups
    # computing probs from counting occurences
    d = factorial(big(365)) / factorial(big(365-g))
    n = big(365)^big(g)
    p = d/n
    p2 = Float64(p)

    # computing probs from simulating the sets
    successes = 0
    for i in 1:tests
        birthdays = []
        for j in 1:g
            push!(birthdays, Int64(floor(365* rand()) + 1 ))
        end
        birthdaySet = Set(birthdays) # sets don't hold duplicate values
        if(length(birthdays) == length(birthdaySet))
            successes += 1
        end
    end
    pSim = successes/tests

    println("$g : $p2 - $pSim")
end
