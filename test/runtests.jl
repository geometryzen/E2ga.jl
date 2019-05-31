using E2ga
using Test

@testset "+" begin
    a = E2ga.Geometric2(1, 3, 7, 13)
    b = E2ga.Geometric2(2, 5, 11, 17)
    c = a + b
    @test c.α == 3
    @test c.x == 8
    @test c.y == 18
    @test c.β == 30
end

@testset "-" begin
    a = E2ga.Geometric2(2, 5, 11, 17)
    b = E2ga.Geometric2(1, 3, 7, 13)
    c = a - b
    @test c.α == 1
    @test c.x == 2
    @test c.y == 4
    @test c.β == 4
end

@testset "*" begin
    a = E2ga.Geometric2(2, 5, 11, 17)
    b = E2ga.Geometric2(1, 3, 7, 13)
    c = a * b
    @test c.α == (2 * 1) + (5 * 3) + (11 * 7) - (17 * 13)
    @test c.x == (2 * 3) + (5 * 1) - (11 * 13) + (17 * 7)
    @test c.y == (2 * 7) + (5 * 13) + (11 * 1) - (17 * 3)
    @test c.β == (2 * 13) + (5 * 7) - (11 * 3) + (17 * 1)
end

@testset "show" begin
    a = E2ga.Geometric2(2, 5, 11, 17)
    @test "$(a)" == "2.0 + 5.0e1 + 11.0e2 + 17.0I"
end
