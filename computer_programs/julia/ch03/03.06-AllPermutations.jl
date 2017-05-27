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
# 03.06 - AllPermutations
# List all the possible permutations of an array
# ------------------------------------------------------------------------------

# a bit faster. call it with myexpand(vectorToPermute,[])
function myexpand(v,sub)
    if length(sub) >= length(v)
        return sub
    end
    subsubs =[]
    outsubs =[]
    for i = 1:length(v)
        if( ! in(v[i],sub))
          sub2 = copy(sub)
          push!(sub2,v[i])
          push!(subsubs,sub2)
        end
    end
    for i in subsubs
      out = myexpand(v,i)
      append!(outsubs,out) # push to have a tree representation, append will instead flat everything
    end
    return outsubs
end

# Simple but slower. call it with myPermutation([],Set(vectorToPermute))
function myPermutation{T}(root::Vector{T},remChoises::Set{T})
    outs = []
    for i = remChoises
        copiedRoot = copy(root)
        newsegment = push!(copiedRoot,i)
        append!(outs,myPermutation(newsegment,setdiff(remChoises,i)))
    end
    if isempty(outs)
        return root
    else
        return outs
    end
end

while true
    print("Please specify the size of the array to compute the permutations [0 to exit, default: 4] ? ")
    n = 4
    rawinput = readline()
    rawinput = chomp(rawinput)
    if rawinput != ""
         n = parse(Int, rawinput)
    end
    if n == 0
        break
    end

    v = collect(1:n)
    p = Int64[]
    p = myexpand(v,p)
    l_p = length(p)
    OUT = reshape(p,(n,Int(l_p/n)))'

    for i in 1:size(OUT)[1]
        println(OUT[i,:])
    end
end
