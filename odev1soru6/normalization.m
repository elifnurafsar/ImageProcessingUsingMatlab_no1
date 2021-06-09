function img = normalization(I)
    [x,y]=size(I);
    max=-1;
    min=0;
    for i=1:x
        for j=1:y
            if I(i,j)>max
                max=I(i,j);
            else
                if I(i,j)<min
                    min=I(i,j);
                end
            end
        end
    end
    I = I - min;
    range = 255/max-min;
    img = (I*range) + min;
    %img = rescale(I,0,255);
end