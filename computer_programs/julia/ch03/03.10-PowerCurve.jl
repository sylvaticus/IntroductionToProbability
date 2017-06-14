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
# 03.10 - PowerCurve
# Plot the probability of a type-1 error over a Bernulli distribution
# ------------------------------------------------------------------------------

println("Plotting probability of type-1 error (wrongly rejecting null hyp)")
using StatsBase, Plots
#unicodeplots()
#pyplot() # for better charts

n = 100
res = 0.01
P = collect(0.4:res:1)
M = [69,73]

for (i,m) in enumerate(M)
    A = []
    for p in P
        α = 0.0
        for k = m:n
            α += (binomial(big(n),big(k)) * p^k * (1-p)^(n-k))
        end
        push!(A,α)
    end
    if i == 1
        plot(P, A, label="m=$m")
    else
        plot!(P,A, label="m=$m")
    end
end
lines_x = collect(0.6:res:0.8)
bottom_line_y = [0.05 for i in 1:length(lines_x)]
top_line_y = [0.95 for i in 1:length(lines_x)]
plot!(lines_x,bottom_line_y, label="bottom margin")
plot!(lines_x,top_line_y, label="top margin")
gui()
