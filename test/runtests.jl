using ColorVintner
using Test

@testset "ColorVintner.jl" begin
    # Test that we can access the constants
    @test length(sequential) > 0
    @test length(diverging) > 0
    @test length(qualitative) > 0
    
    # Test that we can get scheme information
    @test list_scheme_colors_in_rbg(:Blues_5) !== nothing
    
    # Test that we can create the DataFrame
    df = list_schemes_colors_in_hex()
    @test size(df, 1) > 0
    @test :Scheme_Name in propertynames(df)
    @test :Colors in propertynames(df)
    
    # Test utility functions
    all_schemes = get_all_schemes()
    @test length(all_schemes) == length(sequential) + length(diverging) + length(qualitative)
    
    counts = get_scheme_count()
    @test counts[:total] == length(all_schemes)
    @test counts[:sequential] == length(sequential)
    @test counts[:diverging] == length(diverging)
    @test counts[:qualitative] == length(qualitative)
end 