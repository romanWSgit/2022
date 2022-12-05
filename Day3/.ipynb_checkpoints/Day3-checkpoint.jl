# Day3
#= 
    Advent of Code 2022
    Day 3

    Date:   03.12.2022
=#

# load Packages:
# .....

# setup
println()
println("==============================================================")
println()
println("Advent of Code 2022")
println()
println("Day 3:")
println()
println("--------------------------------------------------------------")
println("Solutions:")
println("..........")
println("")

# load files
f = open("input.txt")
lines = readlines(f);
close(f)

# helper functions
function signChanger(x)
     x < 0  ? x + 58 : # X = 0 -> loose 
    x
end


# Part 1:
let solution1 = 0
    for i in eachindex(lines)  
        lineLength = length(lines[i])
        line1SplitInt = sort([signChanger(x) for x in [Int(only(y)) for y in split(lines[i][1:Int(lineLength/2)],"")] .-96])
        line2SplitInt = sort([signChanger(x) for x in [Int(only(y)) for y in split(lines[i][Int(lineLength/2) + 1:end],"")] .-96])
        nr = line1SplitInt[findall(in(line2SplitInt),line1SplitInt)[1]]
        solution1 = solution1 + nr
    end
    println("The solution to problem 1 is: ", solution1)
end 

println()


# Part 2:
let solution2 = 0 
    for j in 1:3:length(lines) 
        line1SplitInt = sort([signChanger(x) for x in [Int(only(y)) for y in split(lines[j],"")] .-96])
        line2SplitInt = sort([signChanger(x) for x in [Int(only(y)) for y in split(lines[j+1],"")] .-96])
        line3SplitInt = sort([signChanger(x) for x in [Int(only(y)) for y in split(lines[j+2],"")] .-96])
        nr2 = intersect(line1SplitInt,line2SplitInt, line3SplitInt)[1]
        solution2 = solution2 + nr2
    end
    println("The solution to problem 2 is: ",solution2)
end

println()
println("==============================================================")
