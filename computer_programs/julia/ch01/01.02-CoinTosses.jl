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
# 01.02 - Coin tossing
# Simulate a serie of coin tossing
# ------------------------------------------------------------------------------

while true
    print("How many coin tossing to generate [0 to exit] ? ")
    n = parse(Int, readline())
    if n == 0
        break
    end
    h = 0
    for i in 1:n
        r = rand()
        if r < 0.5
            print("H ")
            h += 1
        else
            print("T ")
        end
    end
    pc = 100*h/n
    println("\nGot $h heads in $n throws ($pc %)")

end
