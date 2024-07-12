function ret = prog(p, n)
    if n == 1
        ret = p;
    else
        ret = conv(crooked_die(p, n-1), p);
    end
end

