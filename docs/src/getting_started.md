# Getting Started

This guide will help you get started with ColorVintner.

## Installation

First, install the package:

```julia
using Pkg
Pkg.add("ColorVintner")
```

## Basic Usage

Load the package and start exploring:

```julia
using ColorVintner

# See all available schemes
show_all_scheme_names()
```

## Exploring Color Schemes

### Get Information About a Specific Scheme

```julia
# Get detailed information about a scheme
colors = list_scheme_colors_in_rbg(:Blues_5)
```

This will show you:
- The scheme name
- Number of colors in the scheme
- Hex color codes for each color

### Get All Schemes as a DataFrame

```julia
# Create a DataFrame with all schemes
df = list_schemes_colors_in_hex()
first(df, 10)  # Show first 10 schemes
```

## Creating Visualizations

### Basic Color Bar Plot

```julia
# Plot a few schemes
plot_color_bars([:Blues_5, :Reds_5, :Greens_5])
```

### Custom Plot Settings

```julia
# Plot with custom settings
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

## Understanding Color Scheme Categories

### Sequential Schemes
Use for data that progresses from low to high values:
```julia
# Examples of sequential schemes
[:Blues_5, :Reds_5, :Greens_5, :Oranges_5]
```

### Diverging Schemes
Use for data with a meaningful center point:
```julia
# Examples of diverging schemes
[:RdBu_5, :PiYG_5, :BrBG_5, :PuOr_5]
```

### Qualitative Schemes
Use for categorical data:
```julia
# Examples of qualitative schemes
[:Set1_5, :Set2_5, :Set3_5, :Paired_5]
```

## Utility Functions

### Get All Schemes

```julia
all_schemes = get_all_schemes()
```

### Get Scheme Counts

```julia
counts = get_scheme_count()
println("Total schemes: ", counts[:total])
println("Sequential: ", counts[:sequential])
println("Diverging: ", counts[:diverging])
println("Qualitative: ", counts[:qualitative])
``` 