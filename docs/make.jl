using Documenter
using MaterialDocs
using ColorVintner

makedocs(;
    sitename = "ColorVintner.jl",
    authors = "Richard Careaga <public@careaga.net>",
    modules = [ColorVintner],
    format = Material3(;
        theme = :ocean_depth,
        dark_mode = :toggle,
        edit_link = "main",
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://technocrat.github.io/ColorVintner.jl",
    ),
    repo = Remotes.GitHub("technocrat", "ColorVintner.jl"),
    pages = [
        "Home" => "index.md",
        "Getting Started" => "getting_started.md",
        "API Reference" => "api.md",
        "Examples" => "examples.md",
    ],
    checkdocs = :none,
)

deploydocs(;
    repo = "github.com/technocrat/ColorVintner.jl.git",
    devbranch = "main",
)
