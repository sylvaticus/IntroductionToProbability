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
# 01.05 - Head or Tail simulation
# Check who win and who is in the lead (and how often) in a 40-tosses
# serie of coin throws.
#
# ------------------------------------------------------------------------------

using StatsBase, Plots
unicodeplots()
#pyplot()

while true
    print("How many 40-tosses series to generate [0 to exit] ? ")
    x = parse(Int, readline())
    if x == 0
        break
    end
    nGames = 40
    hGains = Int[]
    nHLeads = Int[]
    for i in 1:x
        hGain = 0
        nHLead = 0

        for j in 1:nGames
            r = rand()
            previousHGain = hGain
            if r < 0.5 # head
                hGain += 1
            else
                hGain -= 1
            end
            if (hGain > 0) || (hGain == 0 && previousHGain > 0)
                nHLead += 1
            end
        end
        push!(hGains,hGain)
        push!(nHLeads,nHLead)
    end
    dGains = counts(hGains, -nGames:nGames)
    dLeads = counts(nHLeads, 0:nGames)
    #println("Distribution frequency of the gains:")
    #for j in -nGames:nGames
    #    f = dGains[j+nGames+1]
    #    pc = 100 * f/length(hGains)
    #    println("$(j): $f ($(pc) %)")
    #end
    bar(collect(-nGames:nGames), dGains, title="Gain amounts frequency for Peter.")
    gui()
    bar(collect(0:nGames), dLeads, title="Frequency for leading the game for Peter.")
    gui()
    println(dLeads)
end
