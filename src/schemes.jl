# Color scheme constants
const sequential = [:Blues_3, :Blues_4, :Blues_5, :Blues_6, :Blues_7,
    :Blues_8, :Blues_9, :Blues, :BrBg, :BuGn_3, :BuGn_4, :BuGn_5,
    :BuGn_6, :BuGn_7, :BuGn_8, :BuGn_9, :BuGn, :BuPu, :BuPu_3, :BuPu_4,
    :BuPu_5, :BuPu_6, :BuPu_7, :BuPu_8, :BuPu_9, :GnBu_3, :GnBu_4,
    :GnBu_5, :GnBu_6, :GnBu_7, :GnBu_8, :GnBu_9, :GnBu, :Greens_3,
    :Greens_4, :Greens_5, :Greens_6, :Greens_7, :Greens_8, :Greens_9,
    :Greens, :Greys_3, :Greys_4, :Greys_5, :Greys_6, :Greys_7, :Greys_8,
    :Greys_9, :Greys, :OrRd_3, :OrRd_4, :OrRd_5, :OrRd_6, :OrRd_7,
    :OrRd_8, :OrRd_9, :OrRd, :Oranges_3, :Oranges_4, :Oranges_5,
    :Oranges_6, :Oranges_7, :Oranges_8, :Oranges_9, :Oranges, :PuBuGn,
    :PuBuGn_3, :PuBuGn_4, :PuBuGn_5, :PuBuGn_6, :PuBuGn_7, :PuBuGn_8,
    :PuBuGn_9, :PuBu_3, :PuBu_4, :PuBu_5, :PuBu_6, :PuBu_7, :PuBu_8,
    :PuBu_9, :PuBu, :PuRd_3, :PuRd_4, :PuRd_5, :PuRd_6, :PuRd_7,
    :PuRd_8, :PuRd_9, :PuRd, :Purples_3, :Purples_4, :Purples_5,
    :Purples_6, :Purples_7, :Purples_8, :Purples_9, :Purples, :RdPu_3,
    :RdPu_4, :RdPu_5, :RdPu_6, :RdPu_7, :RdPu_8, :RdPu_9, :RdPu,
    :RdYlGn_3, :RdYlGn_4, :RdYlGn_5, :RdYlGn_6, :RdYlGn_7, :RdYlGn_8,
    :RdYlGn_9, :RdYlGn_10, :RdYlGn_11, :RdYlGn, :Reds_3, :Reds_4, :Reds_5,
    :Reds_6, :Reds_7, :Reds_8, :Reds_9, :Reds, :YlGn, :YlGnBu_3,
    :YlGnBu_4, :YlGnBu_5, :YlGnBu_6, :YlGnBu_7, :YlGnBu_8, :YlGnBu_9,
    :YlGnBu, :YlGn_3, :YlGn_4, :YlGn_5, :YlGn_6, :YlGn_7, :YlGn_8,
    :YlGn_9, :YlOrBr_3, :YlOrBr_4, :YlOrBr_5, :YlOrBr_6, :YlOrBr_7,
    :YlOrBr_8, :YlOrBr_9, :YlOrBr, :YlOrRd, :YlOrRd_3, :YlOrRd_4,
    :YlOrRd_5, :YlOrRd_6, :YlOrRd_7, :YlOrRd_8, :YlOrRd_9, :PuOr_10,
    :PuOr_11, :PuOr, :YlOrBr]

const diverging = [:BrBG_3, :BrBG_4, :BrBG_5, :BrBG_6, :BrBG_7, :BrBG_8,
    :BrBG_9, :BrBG_10, :BrBG_11, :PRGn_3, :PRGn_4, :PRGn_5, :PRGn_6,
    :PRGn_7, :PRGn_8, :PRGn_9, :PRGn_10, :PRGn_11, :PRGn, :PiYG_10,
    :PiYG_11, :PiYG_3, :PiYG_4, :PiYG_5, :PiYG_6, :PiYG_7, :PiYG_8,
    :PiYG_9, :PiYG, :PuOr_3, :PuOr_4, :PuOr_5, :PuOr_6, :PuOr_7,
    :PuOr_8, :PuOr_9, :PuOr_10, :PuOr_11, :PuOr, :RdBu_3, :RdBu_4,
    :RdBu_5, :RdBu_6, :RdBu_7, :RdBu_8, :RdBu_9, :RdBu_10, :RdBu_11,
    :RdBu, :RdGy_10, :RdGy_11, :RdGy, :RdGy_3, :RdGy_4, :RdGy_5,
    :RdGy_6, :RdGy_7, :RdGy_8, :RdGy_9, :RdYlBu_3, :RdYlBu_4, :RdYlBu_5,
    :RdYlBu_6, :RdYlBu_7, :RdYlBu_8, :RdYlBu_9, :RdYlBu_10,
    :RdYlBu_11, :RdYlBu, :Set1_3, :Set1_4, :Set1_5, :Set1_6, :Set1_7,
    :Set1_8, :Set1_9, :Set2_3, :Set2_4, :Set2_5, :Set2_6, :Set2_7,
    :Set2_8, :Set3_3, :Set3_4, :Set3_5, :Set3_6, :Set3_7, :Set3_8,
    :Set3_9, :Set3_10, :Set3_11, :Set3_12, :Spectral_3, :Spectral_4,
    :Spectral_5, :Spectral_6, :Spectral_7, :Spectral_8, :Spectral_9,
    :Spectral_10, :Spectral_11, :Spectral]

const qualitative = [:Accent_3, :Accent_4, :Accent_5, :Accent_6,
    :Accent_7, :Accent_8, :Dark2_3, :Dark2_4, :Dark2_5, :Dark2_6,
    :Dark2_7, :Dark2_8, :Paired_10, :Paired_11, :Paired_12, :Paired_3,
    :Paired_4, :Paired_5, :Paired_6, :Paired_7, :Paired_8, :Paired_9,
    :Pastel1_3, :Pastel1_4, :Pastel1_5, :Pastel1_6, :Pastel1_7,
    :Pastel1_8, :Pastel1_9, :Pastel2_3, :Pastel2_4, :Pastel2_5,
    :Pastel2_6, :Pastel2_7, :Pastel2_8]

"""
    list_scheme_colors_in_rbg(scheme_name::Symbol)

Display information about a specific color scheme including its colors in hex format.

# Arguments
- `scheme_name::Symbol`: The name of the color scheme to examine

# Returns
- `Vector{Color}`: The colors in the scheme, or `nothing` if the scheme is not found

# Examples
```julia
colors = list_scheme_colors_in_rbg(:Blues_5)
```
"""
function list_scheme_colors_in_rbg(scheme_name::Symbol)
    try
        colors = ColorSchemes.colorschemes[scheme_name]
        println("Scheme: $scheme_name")
        println("Number of colors: $(length(colors))")
        println("Colors: ", [hex(c) for c in colors])
        return colors
    catch e
        println("Error: Scheme $scheme_name not found")
        return nothing
    end
end

"""
    list_schemes_colors_in_hex()

Create a DataFrame containing all color schemes with their hex color representations.

This function combines all sequential, diverging, and qualitative color schemes
and creates a DataFrame with scheme names and their corresponding hex color strings.

# Returns
- `DataFrame`: A DataFrame with columns `Scheme_Name` and `Colors`

# Examples
```julia
df = list_schemes_colors_in_hex()
first(df, 5)  # Show first 5 schemes
```
"""
function list_schemes_colors_in_hex()
    # Combine all vectors into one
    all_schemes = [sequential; diverging; qualitative]

    # Create empty vectors to store results
    scheme_names = String[]
    color_representations = String[]

    # Iterate through each scheme
    for scheme in all_schemes
        try
            # Get the color scheme
            colors = ColorSchemes.colorschemes[scheme]

            # Convert colors to hex strings for display
            hex_colors = [hex(c) for c in colors]
            color_str = join(hex_colors, ", ")

            push!(scheme_names, string(scheme))
            push!(color_representations, color_str)

        catch e
            # Handle any schemes that might not exist
            push!(scheme_names, string(scheme))
            push!(color_representations, "ERROR: Scheme not found")
            println("Warning: Scheme $scheme not found in ColorSchemes")
        end
    end

    # Create DataFrame
    df = DataFrame(
        Scheme_Name=scheme_names,
        Colors=color_representations
    )

    return df
end 