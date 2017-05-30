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
# 03.08 - BinomialPlot
# Plot binomial distribution
# ------------------------------------------------------------------------------

using StatsBase, Plots
unicodeplots()
#pyplot() # for better charts

P = [0.5, 0.3]
N1 = [40,80,160]
N2 = [30,120,270]

println("Bernulli probabilities")

for p in P
    if(p==0.5)
        N = N1
    else
        N = N2
    end
    println("**** p = $p ****")
    for n in N
        outs=[]
        for k in 0:n
          push!(outs, binomial(big(n),big(k)) * p^k * (1-p)^(n-k))
        end
        bar(collect(0:n), outs, title="p=$p, n=$n", xticks = 0:10:n,)
        gui()
        print("Press enter to continue.. ")
        rawinput = readline()
    end
end
