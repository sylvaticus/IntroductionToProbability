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
# 03.09 - GaltonBoard
# Simulate a Galton Board (i.e. a binomial distribution)
# ------------------------------------------------------------------------------

println("Simulation of a Galton Board (i.e., of a binomial distribution)")
using StatsBase, Plots
unicodeplots()
#pyplot() # for better charts


N     = big(20)
ssize = 10000

outs  = zeros(Int64, N)+1

for s in 1:ssize
  res=1
  for n in 1:N
   res = (rand() > 0.5) ?  res+1: res
  end
  outs[res] += 1
end

println("Results of the simulation:")
println("pos \t outcomes")
for (p,v) in enumerate(outs)
    println("$p \t $v")
end

bar(collect(0:N), outs, title="p=0.5, n=$N, ssize=$ssize", xticks = 0:10:N,)
gui()
