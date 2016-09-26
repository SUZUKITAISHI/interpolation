immutable lin_interp2
    grid::Array
    vals::Array
end

function Base.call(points::lin_interp2, x::Real)
    i = searchsortedlast(grid, x)
    if i == 0 || i == length(grid)
        return 0
    end
    x_i = points.grid[i]
    x_j = points.grid[i + 1]
    y_i = points.vals[i]
    y_j = points.vals[i + 1]
        
    y = y_i + (y_j - y_i) * ((x - x_i) / (x_j - x_i))
    return y
end

function Base.call{T<:Real}(points::lin_interp2, x::AbstractVector{T})
    n = length(x)
    out = Array(Float64, n)
    for t in 1:n
        out[t] = points(x[t])
    end
    return out
end