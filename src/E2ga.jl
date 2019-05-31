module E2ga

import Base.show, Base.+, Base.-, Base.*

struct Geometric2
    α::Float64
    x::Float64
    y::Float64
    β::Float64
end

function +(a::Geometric2, b::Geometric2)
    α = a.α + b.α
    x = a.x + b.x
    y = a.y + b.y
    β = a.β + b.β
    return Geometric2(α, x, y, β)
end

function -(a::Geometric2, b::Geometric2)
    α = a.α - b.α
    x = a.x - b.x
    y = a.y - b.y
    β = a.β - b.β
    return Geometric2(α, x, y, β)
end

function *(a::Geometric2, b::Geometric2)
    α = a.α * b.α + a.x * b.x + a.y * b.y - a.β * b.β
    x = a.α * b.x + a.x * b.α - a.y * b.β + a.β * b.y
    y = a.α * b.y + a.x * b.β + a.y * b.α - a.β * b.x
    β = a.α * b.β + a.x * b.y - a.y * b.x + a.β * b.α
    return Geometric2(α, x, y, β)
end

function show(io::IO, m::Geometric2)
    print(io, "$(m.α) + $(m.x)e1 + $(m.y)e2 + $(m.β)I")
end

end
