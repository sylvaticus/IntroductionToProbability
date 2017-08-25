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
# 04.01 - Bayes
# Compute the posterior or Bayes probabilities, i.e. P(x|y) knowing P(y|x)
# ------------------------------------------------------------------------------

using DataFrames

println("Compute the posterior or Bayes probabilities, i.e. P(x|y) knowing P(y|x)")
cases = wsv"""
disease   pp   pn    np  nn
d1      2110  301   704 100
d2       396  132  1187 410
d3       510 3568    73 509
"""
println("Cases:")
println(cases)

H = cases[:disease]
Hts = [sum(Array(cases[i,2:end]))  for i in 1:length(H) ]
Ct = sum(Hts)
E = names(cases)[2:end]
println("Posterior probabilities P(h|e):")
for (i,e) in enumerate(E)
    den = sum([ ( (Hts[j]/Ct) * (cases[j,e]/Hts[j]) ) for j in 1:length(H) ])
    numer = 0.0
    for j in 1:length(H)
       numer = (Hts[j]/Ct) * (cases[j,e]/Hts[j])
       println("($(H[j]), $(E[i])): $(string(numer/den))")
    end
end
