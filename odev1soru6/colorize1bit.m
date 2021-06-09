function img = colorize1bit(I, number)
    [x,y,~]=size(I);
    E = ones(x,y);
    for c = 1:x
        for e = 1:y
            if I(c,e) < number
                E(c,e) = 0;
            end
        end
    end
    img = E;
end