module E2ga

import Base.show, Base.+, Base.-, Base.*

export Geometric2

struct Geometric2{T <: Real}
    α::T
    x::T
    y::T
    β::T
end
Geometric2(α::Real, x::Real, y::Real, β::Real) = Geometric2(promote(α, x, y, β)...)
Geometric2(α::Real) = Geometric2(α, zero(α), zero(α), zero(α))

promote_rule(::Type{Geometric2{T}}, ::Type{S}) where {T <: Real,S <: Real} = Geometric2{promote_type(T, S)}
promote_rule(::Type{Geometric2{T}}, ::Type{Geometric2{S}}) where {T <: Real,S <: Real} = Geometric2{promote_type(T, S)}

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
