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
# 03.05 - Records
# Count the number of records in random permutations
# ------------------------------------------------------------------------------

function computeRecords(a)
    r_n = 1
    r_v = a[1]
    for i in 1:length(a)
        if a[i] > r_v
            r_n += 1
            r_v = a[i]
        end
    end
    return r_n
end

tests = 500000
while true
    print("Please specify the number of integers in the array to compute the average records [0 to exit, default: 10] ? ")
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
    records = []
    for i in 1:tests
        push!(records, computeRecords(shuffle(v)))
    end
    avg = mean(records)
    avg_real = log(n)+ γ + 1/(2*n) # γ is the Euler-Mascheroni constant.. =~ 0.577.. this is not said in the text!
    println("Average number of records (n = $n, repetitions = $tests): $avg (should be approx $avg_real)")
end
