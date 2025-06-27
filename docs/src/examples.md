# Examples

This page provides practical examples of how to use ColorVintner.

## Basic Exploration

### List All Available Schemes

```julia
using ColorVintner

# Print all scheme names to console
show_all_scheme_names()
```

### Examine a Specific Scheme

```julia
# Get detailed information about Blues_5
colors = list_scheme_colors_in_rbg(:Blues_5)
```

Output:
```
Scheme: Blues_5
Number of colors: 5
Colors: ["#EFF3FF", "#C6DBEF", "#9ECAE1", "#6BAED6", "#3182BD"]
```

### Get All Schemes as DataFrame

```julia
# Create DataFrame with all schemes
df = list_schemes_colors_in_hex()

# Show first few rows
first(df, 5)
```

## Basic Plotting

### Simple Color Bar Plot

```julia
# Plot a few schemes
plot_color_bars([:Blues_5, :Reds_5, :Greens_5])
```

### Custom Plot Layout

```julia
# Plot with custom settings
plot_color_bars([:Blues_5, :Reds_5, :Greens_5, :Oranges_5], 
                schemes_per_row=2,
                figsize=(1200, 800),
                plot_title="My Favorite Schemes")
```

### Save Plot to File

```julia
# Save plot as PDF
plot_color_bars([:Blues_5, :Reds_5, :Greens_5], 
                save_path="my_color_schemes.pdf",
                plot_title="Saved Color Schemes")
```

## Comprehensive Visualization

### All Categories at Once

```julia
# Create plots for all categories
plots = plot_schemes_by_category()

# This creates:
# - 4 sequential scheme plots (parts 1-4)
# - 3 diverging scheme plots (parts 1-3)  
# - 2 qualitative scheme plots (parts 1-2)
```

### Save All Plots to Directory

```julia
# Create directory and save all plots
plots = plot_schemes_by_category(save_dir="./color_plots")
```

### Individual Category Plots

```julia
# Just sequential schemes
seq_plots = plot_sequential_schemes_split()

# Just diverging schemes  
div_plots = plot_diverging_schemes_split()

# Just qualitative schemes
qual_plots = plot_qualitative_schemes_split()
```

## Working with Scheme Categories

### Sequential Schemes

```julia
# Plot first 8 sequential schemes
plot_color_bars(sequential[1:8], 
                schemes_per_row=4,
                plot_title="Sequential Schemes (First 8)")

# Plot all Blues variants
blues_schemes = filter(x -> startswith(string(x), "Blues"), sequential)
plot_color_bars(blues_schemes, 
                plot_title="All Blues Schemes")
```

### Diverging Schemes

```julia
# Plot first 6 diverging schemes
plot_color_bars(diverging[1:6], 
                schemes_per_row=3,
                plot_title="Diverging Schemes (First 6)")

# Plot all RdBu variants
rdbu_schemes = filter(x -> startswith(string(x), "RdBu"), diverging)
plot_color_bars(rdbu_schemes, 
                plot_title="All RdBu Schemes")
```

### Qualitative Schemes

```julia
# Plot first 8 qualitative schemes
plot_color_bars(qualitative[1:8], 
                schemes_per_row=4,
                plot_title="Qualitative Schemes (First 8)")

# Plot all Set1 variants
set1_schemes = filter(x -> startswith(string(x), "Set1"), qualitative)
plot_color_bars(set1_schemes, 
                plot_title="All Set1 Schemes")
```

## Utility Examples

### Get Scheme Statistics

```julia
# Get counts for each category
counts = get_scheme_count()
println("Total schemes: ", counts[:total])
println("Sequential: ", counts[:sequential])
println("Diverging: ", counts[:diverging])
println("Qualitative: ", counts[:qualitative])
```

### Combine All Schemes

```julia
# Get all schemes in one vector
all_schemes = get_all_schemes()
println("Total schemes available: ", length(all_schemes))

# Plot a random selection
using Random
Random.seed!(42)  # For reproducible results
random_schemes = rand(all_schemes, 12)
plot_color_bars(random_schemes, 
                schemes_per_row=4,
                plot_title="Random Color Schemes")
```

### Distribution Information

```julia
# See how schemes are distributed across plot parts
show_sequential_distribution()
show_diverging_distribution()
show_qualitative_distribution()
```

## Advanced Examples

### Custom Color Scheme Selection

```julia
# Select schemes based on criteria
function get_blue_schemes()
    all_schemes = get_all_schemes()
    blue_schemes = filter(x -> occursin("Blue", string(x)), all_schemes)
    return blue_schemes
end

blue_schemes = get_blue_schemes()
plot_color_bars(blue_schemes, 
                plot_title="All Blue Color Schemes")
```

### Batch Processing

```julia
# Process multiple scheme categories
categories = [sequential, diverging, qualitative]
category_names = ["Sequential", "Diverging", "Qualitative"]

for (schemes, name) in zip(categories, category_names)
    # Plot first 8 schemes from each category
    plot_color_bars(schemes[1:8], 
                    schemes_per_row=4,
                    plot_title="$name Schemes (First 8)",
                    save_path="$(lowercase(name))_schemes.pdf")
end
```

### Interactive Exploration

```julia
# Interactive scheme exploration
function explore_schemes()
    println("Available categories:")
    println("1. Sequential (", length(sequential), " schemes)")
    println("2. Diverging (", length(diverging), " schemes)")
    println("3. Qualitative (", length(qualitative), " schemes)")
    
    # This is a simplified example - in practice you might use a GUI
    println("Enter category number (1-3):")
    # category = readline()
    # ... handle user input
end
``` 