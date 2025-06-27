# This file contains utility functions for the ColorVintner package
# Currently empty, but can be used for helper functions in the future

"""
    get_all_schemes()

Get all available color schemes as a combined vector.

# Returns
- `Vector{Symbol}`: All sequential, diverging, and qualitative schemes combined

# Examples
```julia
all_schemes = get_all_schemes()
```
"""
function get_all_schemes()
    return [sequential; diverging; qualitative]
end

"""
    get_scheme_count()

Get the count of schemes in each category.

# Returns
- `Dict`: Dictionary with counts for each category

# Examples
```julia
counts = get_scheme_count()
```
"""
function get_scheme_count()
    return Dict(
        :sequential => length(sequential),
        :diverging => length(diverging),
        :qualitative => length(qualitative),
        :total => length(sequential) + length(diverging) + length(qualitative)
    )
end 