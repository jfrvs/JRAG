function north_south_east_west(n, s, e, w)
    moves_denominator = gcd(n, s, e, w)

    n = div(n, moves_denominator)
    s = div(s, moves_denominator)
    e = div(e, moves_denominator)
    w = div(w, moves_denominator)

    moves = fill([], (n + s + e + w))

    for i in 1:n
        moves[i] = [0, 1]
    end

    for i in (n + 1):(n + s)
        moves[i] = [0, -1]
    end

    for i in (n + s + 1):(n + s + e)
        moves[i] = [1, 0]
    end

    for i in (n + s + e + 1):(n + s + e + w)
        moves[i] = [-1, 0]
    end

    return moves
end

function random_walk(n::Integer; moves::Array = [[0,1],[0,-1], [1,0], [-1,0]])
    positions = zeros(n + 1, 2);

    for i in 2:(n + 1)
        positions[i,:] = positions[i - 1,:] + rand(moves)
    end

    return positions;

end