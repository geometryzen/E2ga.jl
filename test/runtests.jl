using E2ga
using Test

import E2ga.one, E2ga.e1, E2ga.e2, E2ga.I

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

@testset "one" begin
    @test one.α == 1
    @test one.x == 0
    @test one.y == 0
    @test one.β == 0
end

@testset "e1" begin
    @test e1.α == 0
    @test e1.x == 1
    @test e1.y == 0
    @test e1.β == 0
end

@testset "e2" begin
    @test e2.α == 0
    @test e2.x == 0
    @test e2.y == 1
    @test e2.β == 0
end

@testset "I" begin
    @test I.α == 0
    @test I.x == 0
    @test I.y == 0
    @test I.β == 1
end

@testset "show" begin
    a = E2ga.Geometric2(2, 5, 11, 17)
    @test "$(a)" == "2.0 + 5.0e1 + 11.0e2 + 17.0I"
end
