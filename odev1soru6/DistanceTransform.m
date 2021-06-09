function img = DistanceTransform(I,num)
    [x,y]=size(I);
    distance = I;
    for r = 1:x
        for c = 1:y
            x1=r-1;
            if r==1
                x1=1;
            end
            x2=r;
            x3=r+1;
            y1=c-1;
            if c==1
                y1=1;
            end
            y2=c;
            y3=c+1;
            if c==y
                y3=y;
            end
            if r==x
                x3=x;
            end
            if distance(r,c)==0
                if I(x1,y1) == num
                    distance(r,c) = num+1;
                end
                if I(x1,y2) == num
                    distance(r,c) = num+1;
                end
                if I(x1,y3) == num
                    distance(r,c) = num+1;
                end
                if I(x2,y1) == num
                    distance(r,c) = num+1;
                end
                if I(x3,y1) ==num
                    distance(r,c) = num+1;
                end
                if I(x2,y3) ==num
                    distance(r,c) = num+1;
                end
                if I(x3,y3) ==num
                    distance(r,c) = num+1;
                end
                if I(x2,y2) ==num
                    distance(r,c) = num+1;
                end
            end
        end
    end
    img = distance;
end
