using MatrixDepotTemplate
using MatrixDepot
using Test

@testset "MatrixDepotTemplate.jl" begin
    @test mdinfo("randsym") !== nothing
    @test "randsym" in mdlist(:symmetric & :random)
    @test mdopen("randorth", 3).A isa Matrix
    @test mdopen("randsym", 5).A isa Matrix
end
