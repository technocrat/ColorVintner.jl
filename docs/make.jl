using Documenter
using ColorVintner

# Set up the documentation
makedocs(
    sitename = "ColorVintner",
    format = Documenter.HTML(
        prettyurls = false,
        canonical = nothing
    ),
    modules = [ColorVintner],
    pages = [
        "Home" => "index.md",
        "Getting Started" => "getting_started.md",
        "API Reference" => "api.md",
        "Examples" => "examples.md"
    ]
)

# Build the documentation
deploydocs(
    repo = "github.com/technocrat/ColorVintner.jl.git",
    devbranch = "main"
) 
