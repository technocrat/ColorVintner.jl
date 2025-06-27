"""
    plot_color_bars(schemes::Vector{Symbol}; 
                   schemes_per_row::Int=4,
                   bar_height::Float64=1.0,
                   figsize::Tuple{Int,Int}=(1600, 1200),
                   save_path::Union{String,Nothing}=nothing,
                   plot_title::Union{String,Nothing}=nothing)

Create color bar plots for a list of color schemes using Makie.

This function creates a grid of color bars, where each subplot shows the colors
in a specific color scheme. The bars are sized to be approximately 1cm in height
when displayed.

# Arguments
- `schemes::Vector{Symbol}`: Vector of color scheme symbols to plot
- `schemes_per_row::Int=4`: Number of schemes to display per row
- `bar_height::Float64=1.0`: Height of each color bar (in data coordinates)
- `figsize::Tuple{Int,Int}=(1600, 1200)`: Figure size (width, height) in pixels
- `save_path::Union{String,Nothing}=nothing`: Optional path to save the plot
- `plot_title::Union{String,Nothing}=nothing`: Optional title for the entire plot

# Returns
- `Figure`: The Makie figure object

# Examples
```julia
# Plot a few schemes
plot_color_bars([:Blues_5, :Reds_5, :Greens_5])

# Plot with custom settings
plot_color_bars(sequential[1:8], schemes_per_row=2, 
                save_path="my_plot.pdf", plot_title="My Color Schemes")
```
"""
function plot_color_bars(schemes::Vector{Symbol};
    schemes_per_row::Int=4,
    bar_height::Float64=1.0,
    figsize::Tuple{Int,Int}=(1600, 1200),
    save_path::Union{String,Nothing}=nothing,
    plot_title::Union{String,Nothing}=nothing)

    # Calculate layout
    n_schemes = length(schemes)
    n_rows = ceil(Int, n_schemes / schemes_per_row)

    # Create figure with subplot grid
    fig = Figure(size=figsize)

    # Add overall title if provided
    if plot_title !== nothing
        Label(fig[0, :], plot_title, fontsize=16)
    end

    # Calculate bar height in data coordinates to achieve ~1cm visual height
    # Assuming 96 DPI, 1cm ≈ 38 pixels
    # We need to account for subplot height and data coordinate range
    dpi = 96.0
    target_height_cm = 1.0
    target_height_pixels = target_height_cm * dpi / 2.54  # Convert cm to pixels

    # Calculate subplot height in pixels
    subplot_height_pixels = figsize[2] / n_rows

    # Calculate data coordinate height needed
    # We want the bar to take up a certain fraction of the subplot height
    bar_height_fraction = target_height_pixels / subplot_height_pixels
    actual_bar_height = bar_height_fraction * 2.0  # Scale factor for data coordinates

    for (i, scheme) in enumerate(schemes)
        try
            # Get colors for this scheme
            colors = ColorSchemes.colorschemes[scheme]
            n_colors = length(colors)

            # Calculate subplot position
            row = div(i - 1, schemes_per_row) + 1
            col = mod(i - 1, schemes_per_row) + 1

            # Create subplot with minimal padding and no ticks or numbers
            ax = Axis(fig[row, col],
                title=string(scheme),
                titlesize=10,
                xticksvisible=false,
                yticksvisible=false,
                xgridvisible=false,
                ygridvisible=false,
                leftspinevisible=false,
                rightspinevisible=false,
                topspinevisible=false,
                bottomspinevisible=false,
                xlabelvisible=false,
                ylabelvisible=false,
                xticklabelsvisible=false,
                yticklabelsvisible=false)

            # Create color bars using rectangles
            bar_width = 0.8
            for j in 1:n_colors
                # Create rectangle for each color
                x_center = j
                y_center = actual_bar_height / 2
                x_min = x_center - bar_width / 2
                x_max = x_center + bar_width / 2
                y_min = 0
                y_max = actual_bar_height

                # Define rectangle vertices
                rect = [Point2f(x_min, y_min), Point2f(x_max, y_min),
                    Point2f(x_max, y_max), Point2f(x_min, y_max)]

                poly!(ax, rect, color=colors[j])
            end

            # Set tight limits to minimize padding and remove all numbers
            xlims!(ax, 0.5, n_colors + 0.5)
            ylims!(ax, 0, actual_bar_height)
            hidespines!(ax)
            hidedecorations!(ax, grid=false)

        catch e
            # Handle missing schemes
            row = div(i - 1, schemes_per_row) + 1
            col = mod(i - 1, schemes_per_row) + 1

            ax = Axis(fig[row, col],
                title="$(string(scheme)) (missing)",
                titlesize=10,
                xticksvisible=false,
                yticksvisible=false,
                xgridvisible=false,
                ygridvisible=false,
                leftspinevisible=false,
                rightspinevisible=false,
                topspinevisible=false,
                bottomspinevisible=false,
                xlabelvisible=false,
                ylabelvisible=false)

            # Plot gray bar for missing scheme
            x_center = 1
            y_center = actual_bar_height / 2
            x_min = x_center - 0.4
            x_max = x_center + 0.4
            y_min = 0
            y_max = actual_bar_height

            rect = [Point2f(x_min, y_min), Point2f(x_max, y_min),
                Point2f(x_max, y_max), Point2f(x_min, y_max)]

            poly!(ax, rect, color=:gray)
            xlims!(ax, 0.5, 1.5)
            ylims!(ax, 0, actual_bar_height)
            hidespines!(ax)
            hidedecorations!(ax, grid=false)
            println("Warning: Scheme $scheme not found")
        end
    end

    # Display the figure on screen
    display(fig)

    # Save if path provided
    if save_path !== nothing
        save(save_path, fig)
        println("Plot saved to: $save_path")
    end

    return fig
end

"""
    plot_schemes_by_category(;
        schemes_per_row::Int=4,
        bar_height::Float64=1.0,
        figsize::Tuple{Int,Int}=(1600, 1200),
        save_dir::Union{String,Nothing}=nothing)

Create separate plots for sequential, diverging, and qualitative schemes using Makie.

This function creates comprehensive plots for all three categories of color schemes,
splitting them into manageable parts for better visualization. It displays plots
on screen by default and optionally saves them to a directory.

# Arguments
- `schemes_per_row::Int=4`: Number of schemes to display per row
- `bar_height::Float64=1.0`: Height of each color bar (in data coordinates)
- `figsize::Tuple{Int,Int}=(1600, 1200)`: Figure size (width, height) in pixels
- `save_dir::Union{String,Nothing}=nothing`: Optional directory to save plots

# Returns
- `Dict`: Dictionary containing all created plot objects

# Examples
```julia
# Create all category plots
plots = plot_schemes_by_category()

# Save to a directory
plots = plot_schemes_by_category(save_dir="./color_plots")
```
"""
function plot_schemes_by_category(;
    schemes_per_row::Int=4,
    bar_height::Float64=1.0,
    figsize::Tuple{Int,Int}=(1600, 1200),
    save_dir::Union{String,Nothing}=nothing)
    # Create plots for each category
    plots = Dict()

    println("Creating sequential schemes plots (split into 4 parts)...")
    # Sequential schemes - use the split function
    p_seq = plot_sequential_schemes_split(schemes_per_row=schemes_per_row,
        bar_height=bar_height,
        figsize=figsize,
        save_dir=save_dir)
    plots[:sequential] = p_seq

    # Show distribution info
    show_sequential_distribution()

    println("Creating diverging schemes plots (split into 3 parts)...")
    # Diverging schemes - use the split function
    p_div = plot_diverging_schemes_split(schemes_per_row=schemes_per_row,
        bar_height=bar_height,
        figsize=figsize,
        save_dir=save_dir)
    plots[:diverging] = p_div

    # Show distribution info
    show_diverging_distribution()

    println("Creating qualitative schemes plots (split into 2 parts)...")
    # Qualitative schemes - use the split function
    p_qual = plot_qualitative_schemes_split(schemes_per_row=schemes_per_row,
        bar_height=bar_height,
        figsize=figsize,
        save_dir=save_dir)
    plots[:qualitative] = p_qual

    # Show distribution info
    show_qualitative_distribution()

    return plots
end

"""
    plot_sequential_schemes_split(;
        schemes_per_row::Int=4,
        bar_height::Float64=1.0,
        figsize::Tuple{Int,Int}=(1600, 1200),
        save_dir::Union{String,Nothing}=nothing)

Create separate plots for sequential schemes split into multiple subplots for better organization.

This function splits the sequential color schemes into 4 parts to create more manageable
and readable plots. Each part is displayed separately and optionally saved to files.

# Arguments
- `schemes_per_row::Int=4`: Number of schemes to display per row
- `bar_height::Float64=1.0`: Height of each color bar (in data coordinates)
- `figsize::Tuple{Int,Int}=(1600, 1200)`: Figure size (width, height) in pixels
- `save_dir::Union{String,Nothing}=nothing`: Optional directory to save plots

# Returns
- `Dict`: Dictionary containing the four sequential plot parts

# Examples
```julia
# Create sequential scheme plots
seq_plots = plot_sequential_schemes_split()

# Save to directory
seq_plots = plot_sequential_schemes_split(save_dir="./sequential_plots")
```
"""
function plot_sequential_schemes_split(;
    schemes_per_row::Int=4,
    bar_height::Float64=1.0,
    figsize::Tuple{Int,Int}=(1600, 1200),
    save_dir::Union{String,Nothing}=nothing)
    # Split sequential schemes into 4 groups for better organization
    n_schemes = length(sequential)
    schemes_per_group = ceil(Int, n_schemes / 4)
    seq1 = sequential[1:min(schemes_per_group, end)]
    seq2 = sequential[min(schemes_per_group + 1, end):min(2 * schemes_per_group, end)]
    seq3 = sequential[min(2 * schemes_per_group + 1, end):min(3 * schemes_per_group, end)]
    seq4 = sequential[min(3 * schemes_per_group + 1, end):end]
    # Create plots for each group
    plots = Dict()
    println("Creating sequential schemes - Part 1...")
    # Sequential schemes - Part 1
    p_seq1 = plot_color_bars(seq1,
        schemes_per_row=schemes_per_row,
        bar_height=bar_height,
        figsize=figsize,
        save_path=save_dir !== nothing ? joinpath(save_dir, "sequential_schemes_part1.pdf") : nothing,
        plot_title="Sequential Color Schemes - Part 1 of 4")
    plots[:sequential_part1] = p_seq1
    println("Creating sequential schemes - Part 2...")
    # Sequential schemes - Part 2
    p_seq2 = plot_color_bars(seq2,
        schemes_per_row=schemes_per_row,
        bar_height=bar_height,
        figsize=figsize,
        save_path=save_dir !== nothing ? joinpath(save_dir, "sequential_schemes_part2.pdf") : nothing,
        plot_title="Sequential Color Schemes - Part 2 of 4")
    plots[:sequential_part2] = p_seq2
    println("Creating sequential schemes - Part 3...")
    # Sequential schemes - Part 3
    p_seq3 = plot_color_bars(seq3,
        schemes_per_row=schemes_per_row,
        bar_height=bar_height,
        figsize=figsize,
        save_path=save_dir !== nothing ? joinpath(save_dir, "sequential_schemes_part3.pdf") : nothing,
        plot_title="Sequential Color Schemes - Part 3 of 4")
    plots[:sequential_part3] = p_seq3
    println("Creating sequential schemes - Part 4...")
    # Sequential schemes - Part 4
    p_seq4 = plot_color_bars(seq4,
        schemes_per_row=schemes_per_row,
        bar_height=bar_height,
        figsize=figsize,
        save_path=save_dir !== nothing ? joinpath(save_dir, "sequential_schemes_part4.pdf") : nothing,
        plot_title="Sequential Color Schemes - Part 4 of 4")
    plots[:sequential_part4] = p_seq4
    return plots
end

"""
    plot_diverging_schemes_split(;
        schemes_per_row::Int=4,
        bar_height::Float64=1.0,
        figsize::Tuple{Int,Int}=(1600, 1200),
        save_dir::Union{String,Nothing}=nothing)

Create separate plots for diverging schemes split into multiple subplots for better organization.

This function splits the diverging color schemes into 3 parts to create more manageable
and readable plots. Each part is displayed separately and optionally saved to files.

# Arguments
- `schemes_per_row::Int=4`: Number of schemes to display per row
- `bar_height::Float64=1.0`: Height of each color bar (in data coordinates)
- `figsize::Tuple{Int,Int}=(1600, 1200)`: Figure size (width, height) in pixels
- `save_dir::Union{String,Nothing}=nothing`: Optional directory to save plots

# Returns
- `Dict`: Dictionary containing the three diverging plot parts

# Examples
```julia
# Create diverging scheme plots
div_plots = plot_diverging_schemes_split()

# Save to directory
div_plots = plot_diverging_schemes_split(save_dir="./diverging_plots")
```
"""
function plot_diverging_schemes_split(;
    schemes_per_row::Int=4,
    bar_height::Float64=1.0,
    figsize::Tuple{Int,Int}=(1600, 1200),
    save_dir::Union{String,Nothing}=nothing)
    # Split diverging schemes into 3 groups for better organization
    n_schemes = length(diverging)
    schemes_per_group = ceil(Int, n_schemes / 3)
    div1 = diverging[1:min(schemes_per_group, end)]
    div2 = diverging[min(schemes_per_group + 1, end):min(2 * schemes_per_group, end)]
    div3 = diverging[min(2 * schemes_per_group + 1, end):end]

    # Create plots for each group
    plots = Dict()
    println("Creating diverging schemes - Part 1...")
    # Diverging schemes - Part 1
    p_div1 = plot_color_bars(div1,
        schemes_per_row=schemes_per_row,
        bar_height=bar_height,
        figsize=figsize,
        save_path=save_dir !== nothing ? joinpath(save_dir, "diverging_schemes_part1.pdf") : nothing,
        plot_title="Diverging Color Schemes - Part 1 of 3")
    plots[:diverging_part1] = p_div1
    println("Creating diverging schemes - Part 2...")
    # Diverging schemes - Part 2
    p_div2 = plot_color_bars(div2,
        schemes_per_row=schemes_per_row,
        bar_height=bar_height,
        figsize=figsize,
        save_path=save_dir !== nothing ? joinpath(save_dir, "diverging_schemes_part2.pdf") : nothing,
        plot_title="Diverging Color Schemes - Part 2 of 3")
    plots[:diverging_part2] = p_div2
    println("Creating diverging schemes - Part 3...")
    # Diverging schemes - Part 3
    p_div3 = plot_color_bars(div3,
        schemes_per_row=schemes_per_row,
        bar_height=bar_height,
        figsize=figsize,
        save_path=save_dir !== nothing ? joinpath(save_dir, "diverging_schemes_part3.pdf") : nothing,
        plot_title="Diverging Color Schemes - Part 3 of 3")
    plots[:diverging_part3] = p_div3
    return plots
end

"""
    plot_qualitative_schemes_split(;
        schemes_per_row::Int=4,
        bar_height::Float64=1.0,
        figsize::Tuple{Int,Int}=(1600, 1200),
        save_dir::Union{String,Nothing}=nothing)

Create separate plots for qualitative schemes split into multiple subplots for better organization.

This function splits the qualitative color schemes into 2 parts to create more manageable
and readable plots. Each part is displayed separately and optionally saved to files.

# Arguments
- `schemes_per_row::Int=4`: Number of schemes to display per row
- `bar_height::Float64=1.0`: Height of each color bar (in data coordinates)
- `figsize::Tuple{Int,Int}=(1600, 1200)`: Figure size (width, height) in pixels
- `save_dir::Union{String,Nothing}=nothing`: Optional directory to save plots

# Returns
- `Dict`: Dictionary containing the two qualitative plot parts

# Examples
```julia
# Create qualitative scheme plots
qual_plots = plot_qualitative_schemes_split()

# Save to directory
qual_plots = plot_qualitative_schemes_split(save_dir="./qualitative_plots")
```
"""
function plot_qualitative_schemes_split(;
    schemes_per_row::Int=4,
    bar_height::Float64=1.0,
    figsize::Tuple{Int,Int}=(1600, 1200),
    save_dir::Union{String,Nothing}=nothing)
    # Split qualitative schemes into 2 groups for better organization
    n_schemes = length(qualitative)
    schemes_per_group = ceil(Int, n_schemes / 2)
    qual1 = qualitative[1:min(schemes_per_group, end)]
    qual2 = qualitative[min(schemes_per_group + 1, end):end]

    # Create plots for each group
    plots = Dict()
    println("Creating qualitative schemes - Part 1...")
    # Qualitative schemes - Part 1
    p_qual1 = plot_color_bars(qual1,
        schemes_per_row=schemes_per_row,
        bar_height=bar_height,
        figsize=figsize,
        save_path=save_dir !== nothing ? joinpath(save_dir, "qualitative_schemes_part1.pdf") : nothing,
        plot_title="Qualitative Color Schemes - Part 1 of 2")
    plots[:qualitative_part1] = p_qual1
    println("Creating qualitative schemes - Part 2...")
    # Qualitative schemes - Part 2
    p_qual2 = plot_color_bars(qual2,
        schemes_per_row=schemes_per_row,
        bar_height=bar_height,
        figsize=figsize,
        save_path=save_dir !== nothing ? joinpath(save_dir, "qualitative_schemes_part2.pdf") : nothing,
        plot_title="Qualitative Color Schemes - Part 2 of 2")
    plots[:qualitative_part2] = p_qual2
    return plots
end 