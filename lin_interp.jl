function lin_interp(grid, vals)
    function func(x::Real)
        i = searchsortedlast(grid, x)
        if i == 0 || i == length(grid)
            return 0
        end
        x_i = grid[i]
        x_j = grid[i + 1]
        y_i = vals[i]
        y_j = vals[i + 1]
        
        y = y_i + (y_j - y_i) * ((x - x_i) / (x_j - x_i))
        return y
    end
    
    function func{T<:Real}(x::AbstractVector{T})
        n = length(x)
        out = Array(Float64, n)
        for t in 1:n
            out[t] = func(x[t])
        end
        return out
    end
    
    return func
end