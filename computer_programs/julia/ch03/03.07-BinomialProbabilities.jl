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
# 03.07 - BinomialProbabilities
# Compute a sequence of probabilities of bernulli trials
# ------------------------------------------------------------------------------


n = big(100)
p = 0.5
J = big(45):big(55)


println("Bernulli probabilities")
println("k \t b($n,$p,k)")
for j in J
  binCoeff = factorial(n) / (factorial(j) * factorial(n-j)) # julia native: binomial(n,j)
  ber = binCoeff * p^j * (1-p)^(n-j)
  println("$j \t $(Float16(ber))" )
end
