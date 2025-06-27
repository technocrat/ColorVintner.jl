# ColorVintner

A Julia package for exploring and visualizing ColorBrewer color schemes using Makie.

## Features

- **Comprehensive Color Scheme Access**: Access to all ColorBrewer sequential, diverging, and qualitative color schemes
- **Interactive Visualization**: Create beautiful color bar plots using Makie
- **Scheme Exploration**: Browse and examine color schemes with detailed information
- **Export Capabilities**: Save plots as PDF files for publication
- **Organized Display**: Split large scheme collections into manageable parts

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

## Installation

```julia
using Pkg
Pkg.add("ColorVintner")
```

## Color Scheme Categories

### Sequential Schemes
Sequential color schemes are designed for data that progresses from low to high values. They use a single hue that varies in lightness and saturation.

### Diverging Schemes
Diverging color schemes are designed for data that has a meaningful center point (like zero). They use two different hues that meet at a neutral color.

### Qualitative Schemes
Qualitative color schemes are designed for categorical data. They use distinct colors that are easily distinguishable from each other. 