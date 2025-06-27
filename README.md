# ColorVintner

A Julia package for exploring and visualizing ColorBrewer color schemes using Makie.

## Features

- **Comprehensive Color Scheme Access**: Access to all ColorBrewer sequential, diverging, and qualitative color schemes
- **Interactive Visualization**: Create beautiful color bar plots using Makie
- **Scheme Exploration**: Browse and examine color schemes with detailed information
- **Export Capabilities**: Save plots as PDF files for publication
- **Organized Display**: Split large scheme collections into manageable parts

## Installation

```julia
using Pkg
Pkg.add("ColorVintner")
```

## Quick Start

```julia
using ColorVintner

# Show all available scheme names
show_all_scheme_names()

# Get information about a specific scheme
list_scheme_colors_in_rbg(:Blues_5)

# Create a DataFrame with all schemes and their hex colors
df = list_schemes_colors_in_hex()

# Plot a few schemes
plot_color_bars([:Blues_5, :Reds_5, :Greens_5])

# Create comprehensive plots for all categories
plots = plot_schemes_by_category()
```

## Main Functions

### Exploration Functions

- `show_all_scheme_names()`: Print all available color scheme names
- `list_scheme_colors_in_rbg(scheme_name)`: Display detailed information about a specific scheme
- `list_schemes_colors_in_hex()`: Create a DataFrame with all schemes and their hex representations

### Plotting Functions

- `plot_color_bars(schemes)`: Create color bar plots for a list of schemes
- `plot_schemes_by_category()`: Create comprehensive plots for all categories
- `plot_sequential_schemes_split()`: Create plots for sequential schemes (split into 4 parts)
- `plot_diverging_schemes_split()`: Create plots for diverging schemes (split into 3 parts)
- `plot_qualitative_schemes_split()`: Create plots for qualitative schemes (split into 2 parts)

### Distribution Functions

- `show_sequential_distribution()`: Show how sequential schemes are distributed
- `show_diverging_distribution()`: Show how diverging schemes are distributed
- `show_qualitative_distribution()`: Show how qualitative schemes are distributed

## Examples

### Basic Usage

```julia
using ColorVintner

# Plot a few schemes with custom settings
plot_color_bars([:Blues_5, :Reds_5, :Greens_5], 
                schemes_per_row=3, 
                save_path="my_plot.pdf",
                plot_title="My Color Schemes")
```

### Comprehensive Visualization

```julia
# Create all category plots and save to a directory
plots = plot_schemes_by_category(save_dir="./color_plots")
```

### Scheme Information

```julia
# Get detailed information about a scheme
colors = list_scheme_colors_in_rbg(:Blues_5)

# Get all schemes as a DataFrame
df = list_schemes_colors_in_hex()
first(df, 10)  # Show first 10 schemes
```

## Color Scheme Categories

### Sequential Schemes
Sequential color schemes are designed for data that progresses from low to high values. They use a single hue that varies in lightness and saturation.

### Diverging Schemes
Diverging color schemes are designed for data that has a meaningful center point (like zero). They use two different hues that meet at a neutral color.

### Qualitative Schemes
Qualitative color schemes are designed for categorical data. They use distinct colors that are easily distinguishable from each other.

## Dependencies

- **CairoMakie**: For high-quality plotting
- **ColorSchemes**: For access to ColorBrewer schemes
- **Colors**: For color manipulation
- **DataFrames**: For data organization
- **Makie**: For plotting framework

## License

This package is licensed under the MIT License.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. 