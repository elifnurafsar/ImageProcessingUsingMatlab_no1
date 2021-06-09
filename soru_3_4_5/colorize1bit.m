function img = colorize1bit(I, number)
    E = zeros(512,512);
    for c = 1:512
        for e = 1:512
            if I(c,e) < number
                E(c,e) = 1;
            end
        end
    end
    img = E;
end