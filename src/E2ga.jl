module E2ga

import Base.show, Base.+, Base.-

struct Geometric2
    α::Float64
    x::Float64
    y::Float64
    β::Float64
end # struct

function +(a::Geometric2, b::Geometric2)
    α = a.α + b.α
    x = a.x + b.x
    y = a.y + b.y
    β = a.β + b.β
    return Geometric2(α, x, y, β)
end # function

function -(a::Geometric2, b::Geometric2)
    α = a.α - b.α
    x = a.x - b.x
    y = a.y - b.y
    β = a.β - b.β
    return Geometric2(α, x, y, β)
end # function

function show(io::IO, m::Geometric2)
    print(io, "$(m.α) + $(m.x)e1 + $(m.y)e2 + $(m.β)I")
end # function

end # module
