"""
    show_all_scheme_names()

Print all available color scheme names to the console.

This function iterates through all color schemes (sequential, diverging, and qualitative)
and prints their names. Useful for browsing available schemes or debugging.

# Examples
```julia
show_all_scheme_names()
```
"""
function show_all_scheme_names()
    for row in eachrow(list_schemes_colors_in_hex())
        println(row.Scheme_Name)
    end
end

"""
    show_sequential_distribution()

Show how sequential schemes are distributed across the 4 parts.

This function displays information about how the sequential color schemes
are distributed across the four parts created by `plot_sequential_schemes_split()`.
It prints summary information and returns a dictionary with the scheme groupings.

# Returns
- `Dict`: Dictionary containing the four parts of sequential schemes

# Examples
```julia
distribution = show_sequential_distribution()
```
"""
function show_sequential_distribution()
    n_schemes = length(sequential)
    schemes_per_group = ceil(Int, n_schemes / 4)

    seq1 = sequential[1:min(schemes_per_group, end)]
    seq2 = sequential[min(schemes_per_group + 1, end):min(2 * schemes_per_group, end)]
    seq3 = sequential[min(2 * schemes_per_group + 1, end):min(3 * schemes_per_group, end)]
    seq4 = sequential[min(3 * schemes_per_group + 1, end):end]

    println("Sequential Color Schemes Distribution:")
    println("=====================================")
    println("Total sequential schemes: ", n_schemes)
    println("Schemes per group: ", schemes_per_group)
    println()
    println("Part 1 (", length(seq1), " schemes): ", join(string.(seq1[1:5]), ", "), "...")
    println("Part 2 (", length(seq2), " schemes): ", join(string.(seq2[1:5]), ", "), "...")
    println("Part 3 (", length(seq3), " schemes): ", join(string.(seq3[1:5]), ", "), "...")
    println("Part 4 (", length(seq4), " schemes): ", join(string.(seq4[1:5]), ", "), "...")

    return Dict(:part1 => seq1, :part2 => seq2, :part3 => seq3, :part4 => seq4)
end

"""
    show_diverging_distribution()

Show how diverging schemes are distributed across the 3 parts.

This function displays information about how the diverging color schemes
are distributed across the three parts created by `plot_diverging_schemes_split()`.
It prints summary information and returns a dictionary with the scheme groupings.

# Returns
- `Dict`: Dictionary containing the three parts of diverging schemes

# Examples
```julia
distribution = show_diverging_distribution()
```
"""
function show_diverging_distribution()
    n_schemes = length(diverging)
    schemes_per_group = ceil(Int, n_schemes / 3)

    div1 = diverging[1:min(schemes_per_group, end)]
    div2 = diverging[min(schemes_per_group + 1, end):min(2 * schemes_per_group, end)]
    div3 = diverging[min(2 * schemes_per_group + 1, end):end]

    println("Diverging Color Schemes Distribution:")
    println("====================================")
    println("Total diverging schemes: ", n_schemes)
    println("Schemes per group: ", schemes_per_group)
    println()
    println("Part 1 (", length(div1), " schemes): ", join(string.(div1[1:5]), ", "), "...")
    println("Part 2 (", length(div2), " schemes): ", join(string.(div2[1:5]), ", "), "...")
    println("Part 3 (", length(div3), " schemes): ", join(string.(div3[1:5]), ", "), "...")

    return Dict(:part1 => div1, :part2 => div2, :part3 => div3)
end

"""
    show_qualitative_distribution()

Show how qualitative schemes are distributed across the 2 parts.

This function displays information about how the qualitative color schemes
are distributed across the two parts created by `plot_qualitative_schemes_split()`.
It prints summary information and returns a dictionary with the scheme groupings.

# Returns
- `Dict`: Dictionary containing the two parts of qualitative schemes

# Examples
```julia
distribution = show_qualitative_distribution()
```
"""
function show_qualitative_distribution()
    n_schemes = length(qualitative)
    schemes_per_group = ceil(Int, n_schemes / 2)

    qual1 = qualitative[1:min(schemes_per_group, end)]
    qual2 = qualitative[min(schemes_per_group + 1, end):end]

    println("Qualitative Color Schemes Distribution:")
    println("======================================")
    println("Total qualitative schemes: ", n_schemes)
    println("Schemes per group: ", schemes_per_group)
    println()
    println("Part 1 (", length(qual1), " schemes): ", join(string.(qual1[1:5]), ", "), "...")
    println("Part 2 (", length(qual2), " schemes): ", join(string.(qual2[1:5]), ", "), "...")

    return Dict(:part1 => qual1, :part2 => qual2)
end 