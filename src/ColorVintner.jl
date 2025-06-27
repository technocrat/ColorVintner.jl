module ColorVintner

# Core dependencies
using CairoMakie
using Colors
using ColorSchemes
using DataFrames
using Makie

# Include submodules
include("schemes.jl")
include("exploration.jl")
include("plotting.jl")
include("utilities.jl")

# Re-export main functionality
export show_all_scheme_names, list_scheme_colors_in_rbg, list_schemes_colors_in_hex,
    plot_color_bars, plot_schemes_by_category,
    plot_sequential_schemes_split, show_sequential_distribution,
    plot_diverging_schemes_split, show_diverging_distribution, 
    plot_qualitative_schemes_split, show_qualitative_distribution,
    get_all_schemes, get_scheme_count,
    sequential, diverging, qualitative

end # module ColorVintner 