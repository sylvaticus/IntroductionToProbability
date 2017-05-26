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
# 01.04 - De Mere 2 simulation
# Check the frequency of at least one pair of sixes coming out in a serie of n
# rolls of a die
# ------------------------------------------------------------------------------

while true
    print("How many n-rolls series to generate [0 to exit] ? ")
    x = parse(Int, readline())
    if x == 0
        break
    end
    print("How many individual rolls in the series [default 24] ? ")
    ns = readline()
    n = (ns == "\n") ? 24 : parse(Int,ns)
    succ = 0
    for i in 1:x
        sixes = false
        for j in 1:n
            r1 = rand()
            r2 = rand()
            if (floor(6r1)+1==6) && (floor(6r2)+1==6) # both are 6
                sixes = true
                succ += 1
                break
            end
        end
    end
    pc = 100*succ/x
    println("\nGot $succ successes (at least one pair of sixes) in $x series of $n throws ($pc %)")
end
