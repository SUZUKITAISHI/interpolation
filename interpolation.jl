function my_lin_interp(grid, vals)
    function func(x)
        index_0 = searchsortedlast(grid, x)
        index_1 = index_0 + 1
        x_1 = grid[index_1]
        x_0 = grid[index_0]
        y_1 = vals[index_1]
        y_0 = vals[index_0]
        
        y = y_0 + (y_1 - y_0) * ((x - x_0) / (x_1 - x_0))
        return y
    end
    return func
end
